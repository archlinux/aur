# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-rich
_pkgname=rich
pkgver=1.0.0
pkgrel=1
pkgdesc="A Python library for rich text and beautiful formatting in the terminal"
arch=("any")
url="https://github.com/willmcgugan/rich"
license=('MIT')
depends=("python-colorama"
         "python-pprintpp"
         "python-pygments"
         "python-typing_extensions")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('c1751e6f5c10f42a2248a3badd2fd496b92cf3b6febcdc80ee1df9f0bc6875f7')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
