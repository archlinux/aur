# Maintainer:

_pkgname="app2unit"
pkgname="$_pkgname-git"
pkgver=r5.7a88a4a
pkgrel=2
pkgdesc="Utility to launch commands as systemd user units"
url="https://github.com/Vladimir-csp/app2unit"
license=('GPL-3.0-only')
arch=('any')

depends=(
  libnotify
  sh
  systemd
)
makedepends=(
  git
)

provides=("$_pkgname")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

package() {
  install -Dm755 "$_pkgsrc/app2unit" -t "$pkgdir/usr/bin/"
  install -Dm644 "$_pkgsrc/README.md" -t "$pkgdir/usr/share/doc/$_pkgname/"
}
