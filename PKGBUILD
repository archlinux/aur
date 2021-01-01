# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=grimshot
pkgver=1.5.1
pkgrel=2
pkgdesc="A helper for screenshots within sway."
arch=("x86_64")
url="https://github.com/swaywm/sway"
license=('MIT')
replaces=('swaygrab')
depends=("sway=1:${pkgver}" "grim" "slurp" "jq" "xdg-user-dirs")
optdepends=('libnotify: Notify users when a screenshot is taken'
            'wl-clipboard: Copy screenshots')
makedepends=("scdoc")
source=("https://raw.githubusercontent.com/swaywm/sway/${pkgver}/contrib/grimshot.1.scd")
md5sums=('1c83dc3f3d497bb9a790616c5f71fa64')


build() {
  cd "$srcdir/"
  scdoc < grimshot.1.scd > grimshot.1
}

package() {
  cd "$srcdir/"

  install -Dm 644 grimshot.1 "$pkgdir/usr/share/man/man1/grimshot.1"
  install -dm 755 "$pkgdir/usr/bin/"
  ln -s /usr/share/sway/scripts/grimshot "$pkgdir/usr/bin/grimshot"
}
