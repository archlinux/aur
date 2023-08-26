# Maintainer: Neptune <neptune650@proton.me>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=grimshot
pkgver=1.6.1
pkgrel=2
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
  "$pkgname-$pkgver::https://raw.githubusercontent.com/OctopusET/sway-contrib/master/grimshot"
  "$pkgname-$pkgver.1.scd::https://raw.githubusercontent.com/OctopusET/sway-contrib/master/grimshot.1.scd"
)
sha256sums=('696ebc32bf94de529c5c497b380ec08480f2e03561b1284db329ead4b9e7ef29'
            'e5b1158a01b419447c34f6abd7a16acc3df1710b4f89864f9cbeefca5d403148')

build() {
  cd "$srcdir/"
  scdoc < $pkgname-$pkgver.1.scd > grimshot.1
}

package() {
  cd "$srcdir/"

  install -Dm 644 grimshot.1 "$pkgdir/usr/share/man/man1/grimshot.1"
  install -Dm 755 $pkgname-$pkgver "$pkgdir/usr/bin/grimshot"
}
