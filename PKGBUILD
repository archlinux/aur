# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=grimshot-git
pkgver=1.4
pkgrel=1
pkgdesc="A helper for screenshots within sway."
arch=("x86_64")
url="https://github.com/swaywm/sway"
license=('MIT')
depends=("sway" "grim" "slurp" "jq" "xdg-user-dirs")
optdepends=('libnotify: Notify users when a screenshot is taken'
            'wl-clipboard: Copy screenshots')
makedepends=("scdoc")
source=("git+https://github.com/swaywm/sway.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/sway/contrib"
  scdoc < grimshot.1.sdc > grimshot.1
}

package() {
  cd "$srcdir/sway/contrib"

  install -Dm 644 grimshot.1 "$pkgdir/usr/share/man/man1/grimshot.1"
  install -Dm 755 grimshot "$pkgdir/usr/bin/grimshot"
}
