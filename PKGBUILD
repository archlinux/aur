# Maintainer: lmartinez-mirror
pkgname=mpv-sponsorblock-minimal-git
_pkgname=${pkgname%-git}
pkgver=r9.b297fba
pkgrel=1
pkgdesc="A minimal script to skip sponsored segments of YouTube videos"
arch=('any')
url="https://codeberg.org/jouni/mpv_sponsorblock_minimal"
license=('GPL3')
depends=('mpv' 'curl')
makedepends=('git')
provides=('mpv-sponsorblock')
conflicts=('mpv-sponsorblock')
install=mpv-sponsorblock-minimal.install
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  install -Dm 755 sponsorblock_minimal.lua "$pkgdir/usr/lib/mpv/sponsorblock-minimal.lua"
}

