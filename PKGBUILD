# Maintainer: wyzdwdz <wyzdwdz@gmail.com>
pkgname="sideloader-bin"
pkgver="1.0_pre3"
pkgrel="2"
pkgdesc="Open-source cross-platform iOS app sideloader"
arch=("x86_64" "aarch64")
url="https://github.com/Dadoum/Sideloader"
license=("SSPL-1.0")
depends=("libimobiledevice" "libplist" "openssl" "gtk4" "libadwaita" "glib2" "util-linux-libs")
makedepends=("unzip")
source_x86_64=("sideloader-gtk-linux-x86_64-$pkgver.zip"::"https://github.com/Dadoum/Sideloader/releases/download/${pkgver//_/-}/sideloader-gtk-linux-x86_64.zip")
source_aarch64=("sideloader-gtk-linux-aarch64-$pkgver.zip"::"https://github.com/Dadoum/Sideloader/releases/download/${pkgver//_/-}/sideloader-gtk-linux-aarch64.zip")
sha256sums_x86_64=("cd9e4ab4e5ef8b63f89528849d26476d5c665243df97cb7ac60da3d273b812b8")
sha256sums_aarch64=("ff905d4d90b9c93f82ce5c6807cf8108e74d4a26d26a09f667a2f55be4f4186b")
noextract=("sideloader-gtk-linux-x86_64-$pkgver.zip" "sideloader-gtk-linux-aarch64-$pkgver.zip")

prepare() {
  unzip sideloader-gtk-linux-$CARCH-$pkgver.zip
}

package() {
  install -Dm755 sideloader-gtk-linux-$CARCH "$pkgdir/usr/bin/sideloader"
}
