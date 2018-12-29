# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Johannes Wienke <languitar at semipol dot de>
# Contributor: Danilo Bargen <aur at dbrgn dot ch>

pkgname=geotag
pkgver=0.103
pkgrel=1
pkgdesc="Match date/time information from photos with location information from a GPS unit or from a map"
arch=('any')
url="http://geotag.sourceforge.net/"
license=('GPL')
depends=('java-runtime' 'perl-image-exiftool')
optdepends=('dcraw: display preview for RAW images'
            'gpsbabel: load tracks from GPS')
source=("https://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.jar"
        "$pkgname.desktop"
        "$pkgname.sh")
noextract=("$pkgname-$pkgver.jar")
sha256sums=('9c12b0bdc8e497b461a5fb1611175e7c26750617febc70dd92b5c7783d69b2ba'
            '8bce60d5a6c8ac61a4e72f433fcb921cc4df7ded3ffb954838aedc07f9ae8c0a'
            '8a21754c6bee1d1e72dae11b27bc86436f378dd3a9ff33b4b13c73e4f882c89d')

prepare() {
  bsdtar -xf $pkgname-$pkgver.jar images/$pkgname-128.png
}

package() {
  install -Dm644 $pkgname-$pkgver.jar "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
  install -Dm644 $pkgname.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 images/$pkgname-128.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
