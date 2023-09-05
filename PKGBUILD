# Maintainer: Neptune <neptune650@proton.me>
# Contributor: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=grimshot
pkgver=1.6.1
pkgrel=5
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
  "$pkgname-$pkgver::https://raw.githubusercontent.com/OctopusET/sway-contrib/a90c7a28f57192f2937820508a7262f4323abef3/grimshot"
  "$pkgname-$pkgver.1.scd::https://raw.githubusercontent.com/OctopusET/sway-contrib/a90c7a28f57192f2937820508a7262f4323abef3/grimshot.1.scd"
)
sha256sums=('54b306a51bd4849d569e3e84e14e5fe87d476fef6bbaba40d8b17048de62513e'
            '1eb7a44acbe9a6c67075973942810c1728d3c0c807d2461f32fdce1c2c6a1dd2')

build() {
  cd "$srcdir/"
  scdoc < $pkgname-$pkgver.1.scd > grimshot.1
}

package() {
  cd "$srcdir/"

  install -Dm 644 grimshot.1 "$pkgdir/usr/share/man/man1/grimshot.1"
  install -Dm 755 $pkgname-$pkgver "$pkgdir/usr/bin/grimshot"
}
