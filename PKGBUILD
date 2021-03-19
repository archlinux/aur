pkgbase='python-cryptofetch'
pkgname=('python-cryptofetch')
_module='cryptofetch'
pkgver=1.2.2
pkgrel=1
pkgdesc="CLI tool to fetch and view cryptocurrencies prices"
url="https://github.com/codeswhite/cryptofetch"
depends=('python' 'python-requests' 'python-prettytable' 'python-interutils')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("69d045edbdb552e785135e076737b60441078827ce01f761003c2b1c7cb40ace")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
