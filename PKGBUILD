# Maintainer: brionical27 <brionical@proton.me>
pkgname=sonyheadphonesclient-bluetooth-bin
_pkgname=sonyheadphonesclient-bluetooth
pkgver=1.4.1
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
  "bdf2c39d1853a2f7166e4d513ba7923165b11e79ab96a8df48cace8f1e246663"
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
