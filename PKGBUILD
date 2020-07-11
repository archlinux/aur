pkgbase='python-aur-deploy'
pkgname=('python-aur-deploy')
_module='aur-deploy'
pkgver=0.7.4
pkgrel=1

pkgdesc="Automate updating pkgbuild and deploying to AUR"
url="https://github.com/codeswhite/aur-deploy"
depends=('python')
makedepends=('python-setuptools' 'python-interutils' 'python-requests' 'python-beautifulsoup4' 'pip2pkgbuild')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/aur-deploy/aur-deploy-${pkgver}.tar.gz")
sha256sums=("bed888e576237687aea6ea46db0356d4246d992aa623673c354297f6d97fc86a")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
