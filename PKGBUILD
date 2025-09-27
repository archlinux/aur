# Maintainer: BNDays27 <brionical@proton.me>
pkgname=sonyheadphonesclient-bluetooth-bin
_pkgname=sonyheadphonesclient-bluetooth
pkgver=1.4.4
pkgrel=1
provides=("sonyheadphonesclient-bluetooth")
conflicts=("sonyheadphonesclient-bluetooth")
pkgdesc="Desktop client recreating the functionality of the Sony Headphones app (Bluetooth/TWS/XM5+)"
arch=("x86_64")
url="https://github.com/mos9527/SonyHeadphonesClient"
license=('MIT')
depends=("glfw" "unzip" "gcc-libs" "libglvnd" "glibc" "dbus" "bluez-libs"  "dbus")
source=(
  "$pkgname-$pkgver.x64"::"$url/releases/download/$pkgver/SonyHeadphonesClient-linux-x64"
  "LICENSE-$pkgver"::"$url/raw/refs/tags/$pkgver/LICENSE"
)
sha256sums=(
  "3830e3ad7153095df85902589fff8684a4efe145d90794b568a213b2d099e563"
  '0b3db3e11db69b6d0de551cb7d9a56cc65be7f8fd912bcf6bae61ba57df36c34'
)

package() {
  install -Dm755 "$pkgname-$pkgver.x64" "$pkgdir/usr/bin/$_pkgname"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/sonyheadphonesclient-bluetooth.desktop" << END
[Desktop Entry]
Name=Sony Headphones Client [XM5+]
Comment=[XM5+] A Linux client recreating the functionality of the Sony Headphones app
Exec=$_pkgname
Terminal=false
Categories=Utility;
Type=Application
Icon=audio-headphones
END

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
