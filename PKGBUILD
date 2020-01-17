maintainer="Milk Brewster (milkii on Freenode)"
pkgname=mod-cv-plugins-git
pkgver=r143.8dee8b7
pkgrel=1
pkgdesc="CV (audio-rate control) LV2 plugins from MOD Devices."
#epoch=0
arch=('i686' 'x86_64')
url="https://github.com/moddevices/mod-cv-plugins"
license=()
groups=(lv2-plugins)
depends=()
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/moddevices/mod-cv-plugins")
noextract=()
md5sums=('SKIP')
#sha1sums=()
#sha256sums=()
#sha384sums=()
#sha512sums=()

pkgver() {
  cd "${srcdir}/mod-cv-plugins"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare()
{
  cd "$srcdir/mod-cv-plugins"

}

build() {
  cd "$srcdir/mod-cv-plugins"
}

package() {
  mkdir -p ${pkgdir}/usr/lib/lv2
  cd "$srcdir/mod-cv-plugins"
  make DEST_DIR="$pkgdir/usr/lib/lv2" install
}

# vim:set ts=2 sw=2 et:
