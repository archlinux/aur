# Maintainer: DeedleFake <deedlefake at users dot noreply dot github dot com>
pkgname=coinomi-desktop
pkgver=latest
pkgrel=1
pkgdesc="Coinomi desktop wallet beta."
arch=(any)
url="https://coinomi.com"
license=('unknown')
depends=(java-runtime)
source=("https://beta.coinomi.com/desktopinstallers/Coinomi.deb")
sha512sums=('320c2a5fad48409419c5584efedee5ba74f15fb2292615c572321ea9d67a4195f7b951a7cce132a636a78fd34ab010cabb968e6cede5e54e2b8c4c15172b0ac7')
md5sums=('45aa4155b562df136255a774adc84230')

prepare() {
	bsdtar -xvf "data.tar.gz"
}

build() {
	cd "usr/bin"
	rm "coinomi"
	mv "coinomi.sh" "coinomi"
	chmod a+x "coinomi"
}

package() {
	cp -a "usr" "$pkgdir/usr"
}
