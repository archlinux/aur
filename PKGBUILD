pkgbase='python-stargen'
pkgname=('python-stargen')
_module='stargen'
pkgver=0.8.6
pkgrel=2
pkgdesc="Framework for wordlist generation, combination and expansion"
url="https://github.com/codeswhite/stargen"
depends=('python' 'python-interutils')
makedepends=('python-setuptools')
optdepends=('crunch: Generating wordlists programmatically')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("aaaad1fa3a9a498f7988709add7dc8d488fa25063ea26dbf55dae49028a455e5")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
