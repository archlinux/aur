# Maintainer: wostarxi <wostarxi@outlook.com>
_pkgname=ranger_devicons
pkgname=ranger_devicons-git
pkgver=r83.feb2d7a
pkgrel=1
pkgdesc="Ranger plugin that adds file glyphs/icon support to Ranger"
arch=("any")
url="https://github.com/alexanderjeurissen/ranger_devicons"
license=('GPL3')
depends=("ranger")
makedepends=('git')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install="${_pkgname}.install"
source=("${pkgname}::git+${url}")
md5sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname}"
    # Git, no tags available
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
      cd "$srcdir/${pkgname}"
      install -m 755 -D __init__.py "$pkgdir/usr/share/ranger/plugins/ranger_devicons/__init__.py"
      install -m 755 -D devicons.py "$pkgdir/usr/share/ranger/plugins/ranger_devicons/devicons.py"
}
