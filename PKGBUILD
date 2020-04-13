# Maintainer: Hao Long <aur@esd.cc>

pkgname=python-rich
_pkgname=rich
pkgver=0.8.10
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
sha256sums=('0fd616194eb671107ca7dca225e79e94dede3de4b5dcb2c1b348ed3e7c05ce13')

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
