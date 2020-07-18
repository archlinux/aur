pkgbase='python-aur-deploy'
pkgname=('python-aur-deploy')
_module='aur-deploy'
pkgver=0.8.1
pkgrel=1



pkgdesc="Automate updating pkgbuild and deploying to AUR"
url="https://github.com/codeswhite/aur-deploy"
depends=('python')
makedepends=('python-setuptools' 'python-interutils' 'python-requests' 'python-beautifulsoup4' 'pip2pkgbuild')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/aur-deploy/aur-deploy-${pkgver}.tar.gz")
sha256sums=("e4bb0ab1422cf1272779731ea0ed70e1ce5e388397a1e83a6d81b8afdcd9d8b2")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
