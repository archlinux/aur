# Maintainer: Franc[e]sco <lolisamurai@tfwno.gf>

pkgname=shmupmametgm-git
pkgver=r79.5ac496e
pkgrel=1
pkgdesc="Customized MAME for the TGM series. Forked for extra output options and tooling."
arch=('x86_64')
url="https://github.com/MaryHal/shmupmametgm"
depends=('sdl' 'gconf')
makedepends=('git')
license=('GPL')
source=("git+https://github.com/MaryHal/shmupmametgm.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/shmupmametgm"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/shmupmametgm"
  make SUBTARGET=tgm NOWERROR=1 || return 1
}

package() {
  install -Dm755 "$srcdir/shmupmametgm/mametgm64" -t "$pkgdir/usr/bin/"
}

