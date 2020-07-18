pkgbase='python-aur-deploy'
pkgname=('python-aur-deploy')
_module='aur-deploy'
pkgver=0.8.0
pkgrel=1



pkgdesc="Automate updating pkgbuild and deploying to AUR"
url="https://github.com/codeswhite/aur-deploy"
depends=('python')
makedepends=('python-setuptools' 'python-interutils' 'python-requests' 'python-beautifulsoup4' 'pip2pkgbuild')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/aur-deploy/aur-deploy-${pkgver}.tar.gz")
sha256sums=("d7967a03ec04ee841a15f2035deb9db58bdf7e1d70871fa81dae2056070d5e4e")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
