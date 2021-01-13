pkgbase='python-aur-deploy'
pkgname=('python-aur-deploy')
_module='aur-deploy'
pkgver=0.8.4
pkgrel=1
pkgdesc="Automate updating pkgbuild and deploying to AUR"
url="https://github.com/codeswhite/aur-deploy"
makedepends=('python-setuptools')
depends=('python' 'twine' 'python-wheel' 'python-beautifulsoup4' 'pip2pkgbuild' 'python-interutils')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("18bc94489b553e70b080a8542cc5df3585b9ac5ca6e8e6e4f7cbe26bcbd32472")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
