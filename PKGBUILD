# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=python-deltachat-cursed
_module=deltachat_cursed
pkgver=0.3.1
pkgrel=1
pkgdesc="Delta Chat client for the command line"
url="https://github.com/adbenitez/deltachat-cursed"
depends=(python-notify-py python-urwid_readline)
makedepends=(python-setuptools)
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/b1/9a/9673391edf2c1dab39f9551eba312740601a9076468893df6286660cf28a/deltachat_cursed-${pkgver}.tar.gz")
sha256sums=('e8bd2526fb7867a2afd4aa5baf20e54b92cd21e6a2184ec739a19466c4e60213')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
