# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=deltachat-cursed
_module=deltachat_cursed
pkgver=0.7.2
pkgrel=2
pkgdesc="Delta Chat client for the command line"
url="https://github.com/adbenitez/deltachat-cursed"
depends=(python-notify-py python-urwid_readline python-deltachat python-emoji)
makedepends=(python-setuptools)
conflicts=(git-delta)
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/f1/46/5e1e4613b0fa6ccbca065825eb450a664a0c9e9409578bf08f1ae58db633/deltachat_cursed-${pkgver}.tar.gz")
sha256sums=('661cb8097314b86c74aafc7ae4e7e9bcdbb0b1ad3d757fc2bb27aad4c877cf1f')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
