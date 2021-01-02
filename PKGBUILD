# Maintainer: Marc Zuo <zuoq at pm dot me>
pkgbase='python-betacode'
pkgname=('python-betacode')
_module='betacode'
pkgver='1.0'
pkgrel=2
pkgdesc="Betacode to Unicode converter."
url="https://github.com/matgrioni/betacode"
depends=('python' 'python-pygtrie')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('259b678e8ce901e8735196d248c9c2ad42a388e990fd8383f972d1b5539b0469')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
