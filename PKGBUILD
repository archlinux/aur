# Maintainer: Neptune <neptune650@proton.me>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=grimshot
pkgver=1.6.1
pkgrel=4
pkgdesc="A helper for screenshots within sway."
arch=("any")
url="https://github.com/swaywm/sway"
license=('MIT')
replaces=('swaygrab')
depends=("grim" "slurp" "jq")
optdepends=('libnotify: Notify users when a screenshot is taken'
            'wl-clipboard: Copy screenshots')
makedepends=("scdoc")
source=(
  "$pkgname-$pkgver::https://github.com/OctopusET/sway-contrib/blob/a90c7a28f57192f2937820508a7262f4323abef3/grimshot"
  "$pkgname-$pkgver.1.scd::https://github.com/OctopusET/sway-contrib/blob/a90c7a28f57192f2937820508a7262f4323abef3/grimshot.1.scd"
)
sha256sums=('de4d998682989cb79b5f20f368be99f3a4727ae7511d248b0bb0546c28db29b0'
            '9b57f2f92f8d0ea3d1c5b86764640d6feb3695f5304f28798fba0689b25256a5')

build() {
  cd "$srcdir/"
  scdoc < $pkgname-$pkgver.1.scd > grimshot.1
}

package() {
  cd "$srcdir/"

  install -Dm 644 grimshot.1 "$pkgdir/usr/share/man/man1/grimshot.1"
  install -Dm 755 $pkgname-$pkgver "$pkgdir/usr/bin/grimshot"
}
