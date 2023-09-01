# Generated using pip2pkgbuild - https://github.com/wenLiangcan/pip2pkgbuild | https://aur.archlinux.org/packages/pip2pkgbuild
# Maintainer: Ryen Burns <bburns91@gmail.com>
# Contributer: loryeam <loryeam@gmail.com>

pkgbase='python-cs50'
pkgname=('python-cs50')
_module='cs50'
pkgver='9.2.5'
pkgrel=9
pkgdesc="CS50 library for Python"
url="https://github.com/cs50/python-cs50"
depends=('python' 'python-flask' 'python-sqlalchemy' 'python-sqlparse' 'python-termcolor' 'python-wheel')
makedepends=('python-build' 'python-installer')
license=('GPLv3')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/${_module/-/_}-$pkgver.tar.gz")
sha256sums=('dcbbc174cc2e5c67c052628ef8afc1659c4f162ab724587e8f07dbe024151be7')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
