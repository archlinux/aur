# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=sewar
pkgver=0.4.3
pkgrel=1
pkgdesc="All image quality metrics you need in one package."
arch=(any)
url="https://github.com/andrewekhalel/sewar"
license=(MIT)
depends=(python)
makedepends=('python-setuptools')
depends=('python-numpy'
         'python-scipy'
         'python-pillow')
provides=('sewar-git')
conflicts=('sewar-git')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('5501f50383294e1293ff276f0545e870488e74a1d5510fa1b310c4cdffcae6b641ec224a7f4d49eb21ad7595b69baa193f3c6e9c848b9a7e9b5cdbd2afce3a6f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
