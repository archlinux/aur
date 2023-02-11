# Contributor: Balló György <ballogyor+arch at gmail dot com>

pkgname=cawbird
pkgver=1.5
pkgrel=2
pkgdesc='Native GTK Twitter client'
arch=('x86_64')
url='https://ibboard.co.uk/cawbird/'
license=('GPL3')
depends=('gspell' 'gst-libav' 'gst-plugin-gtk' 'gst-plugins-bad' 'gst-plugins-good' 'liboauth' 'rest')
makedepends=('meson' 'vala')
source=("https://github.com/IBBoard/$pkgname/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('0ef472cbecd6a7eb384a5b27833612d61eba7ace22293dbe14571b887b61ecae')

build() {
  arch-meson $pkgname-$pkgver build \
    -D consumer_key_base64=YUVNOE14dE5xMVdHRzl2emo5SzNNSlNUeg== \
    -D consumer_secret_base64=c0J0cmc2clNJTFN6bHlSbFNXc2J1MmdvWWk3b0FzTGZHOGI4OG5QRzB3Tmx1Y0ZtOHQ=
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
