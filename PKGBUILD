# Maintainer: aliu <aaronliu0130 gmail.com>
# Contributor: wyzdwdz <wyzdwdz@gmail.com>
pkgname="sideloader-bin"
pkgver="1.0_pre4"
pkgrel="2"
pkgdesc="Open-source cross-platform iOS app sideloader"
arch=("x86_64" "aarch64")
url="https://github.com/Dadoum/Sideloader"
license=("SSPL-1.0")
depends=("libimobiledevice" "libplist" "openssl" "gtk4" "libadwaita" "glib2" "util-linux-libs")
makedepends=("unzip")
source_x86_64=("sideloader-gtk-x86_64-linux-$pkgver.zip"::"https://github.com/Dadoum/Sideloader/releases/download/${pkgver//_/-}/sideloader-gtk-x86_64-linux-gnu.zip"
	"sideloader-cli-x86_64-linux-$pkgver.zip"::"https://github.com/Dadoum/Sideloader/releases/download/${pkgver//_/-}/sideloader-cli-x86_64-linux-gnu.zip")
source_aarch64=("sideloader-gtk-aarch64-linux-$pkgver.zip"::"https://github.com/Dadoum/Sideloader/releases/download/${pkgver//_/-}/sideloader-gtk-aarch64-linux-gnu.zip"
	"sideloader-cli-aarch64-linux-$pkgver.zip"::"https://github.com/Dadoum/Sideloader/releases/download/${pkgver//_/-}/sideloader-cli-aarch64-linux-gnu.zip")
sha256sums_x86_64=('2f22002a370e44fe2d61d520bd905175dead48e70b2dc567390e05d3357a0ae6'
	'e193c02d661a5d797af4b44186c8655d078a0bfde419bdeab934c513d1a7b737')
sha256sums_aarch64=('7365d469af544ce21eb8553f7e37c6e0b82aaaf3884477651fa3748f2ff7392f'
	'3bd61364aee655a44a99837e2f8046d4d9f2455b401a8c32aa909b5de9e6de03')

package() {
  install -Dm755 sideloader-gtk-$CARCH-linux-gnu "$pkgdir/usr/bin/sideloader-gtk"
  ln -s ./sideloader-gtk "$pkgdir/usr/bin/sideloader"
  install -Dm755 sideloader-cli-$CARCH-linux-gnu "$pkgdir/usr/bin/sideloader-cli"
}
