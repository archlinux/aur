pkgbase='python-aur-deploy'
pkgname=('python-aur-deploy')
_module='aur-deploy'
pkgver=0.9.0
pkgrel=1
pkgdesc="Automate updating pkgbuild and deploying to AUR"
url="https://github.com/codeswhite/aur-deploy"
makedepends=('python-setuptools')
depends=('python' 'twine' 'python-wheel' 'python-beautifulsoup4' 'pip2pkgbuild' 'python-interutils')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("e88b99cb672c2170c3e4ff485839e9c20b4c0773ae39a4b0a51e300bd0b1ec1e")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
