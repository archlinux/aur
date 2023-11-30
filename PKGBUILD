# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=deltachat-cursed
_module=deltachat_cursed
pkgver=0.8.0
pkgrel=1
pkgdesc="Delta Chat client for the command line"
url="https://github.com/adbenitez/deltachat-cursed"
depends=(python-notify-py python-urwid_readline python-deltachat python-emoji)
makedepends=(python-setuptools)
license=('GPL')
arch=('any')
source=("https://files.pythonhosted.org/packages/df/7e/85dcd4b7f84ede4d9ff2983234bd89e6fa095b9517fc1a43a5bec97a7040/deltachat_cursed-${pkgver}.tar.gz")
sha256sums=('cd6915d3acfeeabe00bb9d0e8878aee19e48060d4fd090323ae6920171981440')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    rm "${pkgdir}/usr/bin/delta"
    install -Dm644 docs/user-guide.md "${pkgdir}/usr/share/doc/deltachat-cursed/user_guide.md"
}
