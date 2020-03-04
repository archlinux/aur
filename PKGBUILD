# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-rich
_pkgname=rich
pkgver=0.6.0
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
sha256sums=('5a7c30702a8a77cf9c219e0a54ec73e6aa0f63220b2cb95b115014da24f1fd6d')

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
