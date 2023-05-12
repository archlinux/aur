# Contributor: lmartinez-mirror
pkgname=mpv-sponsorblock-minimal-git
_pkgname=${pkgname%-git}
pkgver=r37.27dd1df
pkgrel=1
pkgdesc="A minimal script to skip sponsored segments of YouTube videos"
arch=('any')
url="https://codeberg.org/jouni/mpv_sponsorblock_minimal"
license=('GPL3')
depends=('mpv' 'curl')
optdepends=('lua-curl: use native lua binding to libcurl')
makedepends=('git')
provides=('mpv-sponsorblock')
conflicts=('mpv-sponsorblock')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm644 sponsorblock_minimal.lua "$pkgdir/etc/mpv/scripts/sponsorblock-minimal.lua"
  install -Dm644 README -t "$pkgdir/usr/share/doc/$_pkgname"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
}

