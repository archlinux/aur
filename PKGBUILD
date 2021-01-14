pkgbase='python-stargen'
pkgname=('python-stargen')
_module='stargen'
pkgver=0.8.5
pkgrel=1
pkgdesc="Framework for wordlist generation, combination and expansion"
url="https://github.com/codeswhite/stargen"
depends=('python')
makedepends=('python-setuptools')
optdepends=('crunch: Generating wordlists programmatically')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("c516546005510628638347870a972273c4297dfe38d0ddb83007281317061873")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
