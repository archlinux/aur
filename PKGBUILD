# Maintainer: Aloxaf <aloxafx at gamil>

pkgname=abelian-wallet-desktop
pkgver=0.3.1
pkgrel=1
pkgdesc="Abelian wallet desktop"
arch=("x86_64")
url="https://www.abelian.info"
license=('unknown')
depends=(gtk3 libnotify nss libxtst)
source=("${pkgname}-${pkgver}.zip::https://download.abelian.info/release/abelwallet-desktop/abelian-desktop-wallet-linux-amd64-v${pkgver}.zip")
sha256sums=("b565bf46bf69f1db9f17b23984f99ee52baf5e755f78ec4cb7b68cec82efed26")

prepare() {
	unzip -o ${pkgname}-${pkgver}.zip
	ar vx abelian-wallet-desktop_${pkgver}_amd64.deb
	bsdtar -xpf data.tar.zst
}

package() {
	cp -ar $srcdir/usr $pkgdir/usr
}

