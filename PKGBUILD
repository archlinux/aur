pkgbase='python-aur-deploy'
pkgname=('python-aur-deploy')
_module='aur-deploy'
pkgver=0.9.2
pkgrel=1
pkgdesc="Automate updating pkgbuild and deploying to AUR"
url="https://github.com/codeswhite/aur-deploy"
makedepends=('python-setuptools')
depends=('python' 'twine' 'python-wheel' 'python-beautifulsoup4' 'pip2pkgbuild' 'python-interutils')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=("208e22705aa268880cadce344f3b7b1dc611e7f53a08029993e6693d6f492fd3")

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
