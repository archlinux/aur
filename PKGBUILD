# Maintainer: Kyle Laker <kyle@laker.email>

pkgname=lm-warp-git
pkgver=0.0.1
pkgrel=1
pkgdesc="Share files across the LAN by Linux Mint"
arch=("x86_64")
_github="github.com/linuxmint/warp"
url="https://$_github"
depends=(pygobject-devel python-setproctitle python-zeroconf python-xapp)
makedepends=(git meson)
source=("$pkgname::git://$_github/")
sha512sums=('SKIP')

build() {
  cd "$srcdir"
  pwd
  meson --prefix /usr --buildtype=plain "$pkgname" build
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
