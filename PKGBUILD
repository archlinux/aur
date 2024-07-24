# Maintainer: Matthias Mailänder <matthias@mailaender.name>

pkgbase='python-lib50'
pkgname=('python-lib50')
_module='lib50'
pkgver='3.0.11'
pkgrel=1
pkgdesc="CS50's own internal library used in many of its tools."
url="https://github.com/cs50/lib50"
depends=('python' 'git')
makedepends=('python-build' 'python-installer')
optdepends=('python-babel')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('654042c356e01c35be71aae66fcac5d1a8c49e105c155015f7d5642823da46c4')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
