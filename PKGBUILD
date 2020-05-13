# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-rich
_pkgname=rich
pkgver=1.1.1
pkgrel=1
pkgdesc="A Python library for rich text and beautiful formatting in the terminal"
arch=("any")
url="https://github.com/willmcgugan/rich"
license=('MIT')
depends=("python-colorama"
         "python-pprintpp"
         "python-pygments"
         "python-typing_extensions"
         "python-commonmark")
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('51b0f708c8017591650a75c02f5cd5f87ada1deec324588f11a46f66d0d6b864')

build() {
  cd ${_pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd ${_pkgname}-${pkgver}
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
