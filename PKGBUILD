pkgbase='python-aur-deploy'
pkgname=('python-aur-deploy')
_module='aur-deploy'
pkgver=0.8.2
pkgrel=1
pkgdesc="Automate updating pkgbuild and deploying to AUR"
url="https://github.com/codeswhite/aur-deploy"
depends=('python')
makedepends=('python-setuptools' 'python-interutils' 'python-requests' 'python-beautifulsoup4' 'pip2pkgbuild')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/aur-deploy/aur-deploy-${pkgver}.tar.gz")
sha256sums=("1ed5998565077b389be645f5cd7b4e199833a7cf7bb8173d586267ff4384d950")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
