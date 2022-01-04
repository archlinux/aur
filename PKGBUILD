# Maintainer: Julien Nicoulaud <julien.nicoulaud@gmail.com>
pkgname=ggshield
pkgver=1.10.7
pkgrel=1
pkgdesc="Protect your secrets with GitGuardian."
arch=(any)
url="https://github.com/GitGuardian/ggshield"
license=(MIT)
depends=('python'
         'python-click'
         'python-pygitguardian'
         'python-pyaml'
         'python-dotenv'
         'python-yaspin')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('e002577bf434be85baef737970d387efd95ea094b08b93399be577d2bb5a7f0e')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
