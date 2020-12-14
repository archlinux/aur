# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=grimshot
pkgver=1.5.1
pkgrel=1
pkgdesc="A helper for screenshots within sway."
arch=("x86_64")
url="https://github.com/swaywm/sway"
license=('MIT')
replaces=('swaygrab')
depends=("sway" "grim" "slurp" "jq" "xdg-user-dirs")
optdepends=('libnotify: Notify users when a screenshot is taken'
            'wl-clipboard: Copy screenshots')
makedepends=("scdoc")
source=("https://github.com/swaywm/sway/archive/${pkgver}.tar.gz")
md5sums=('9a7edc89abfc3f36d47546457e0bc901')


build() {
  cd "$srcdir/sway-$pkgver/contrib"
  scdoc < grimshot.1.scd > grimshot.1
}

package() {
  cd "$srcdir/sway-$pkgver/contrib"

  install -Dm 644 grimshot.1 "$pkgdir/usr/share/man/man1/grimshot.1"
  install -Dm 755 grimshot "$pkgdir/usr/bin/grimshot"
}
