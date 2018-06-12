# Maintainer: Joseph Brains <jnbrains@gmail.com>

_pkgname=prompt_toolkit
pkgname=python-${_pkgname}-gns3
pkgver=1.0.15
pkgrel=1
pkgdesc="Library for building powerful interactive command lines in Python (GNS3)"
arch=('any')
depends=('python-pygments' 'python-six' 'python-wcwidth')
makedepends=('python-setuptools')
url="https://github.com/jonathanslenders/python-prompt-toolkit"
license=('BSD')
groups=('gns3')
options=(!emptydirs)
provides=("python-${_pkgname}")
conflicts=("python-${_pkgname}")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-$pkgver.tar.gz")
sha256sums=('858588f1983ca497f1cf4ffde01d978a3ea02b01c8a26a8bbc5cd2e66d816917')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
}
