# Maintainer: Johannes Seitz <aur-requests@seitz.email>

pkgname=remote-utilities-viewer
pkgver=1.0.23.b23
pkgrel=1
pkgdesc='Remote Utilities is highly configurable and secure remote desktop software for IT professionals'
arch=('x86_64')
url='https://www.remoteutilities.com/download/linux.php'
license=('custom')
options=('!strip')
provides=('remote-utilities-viewer')
conflicts=()
depends=('glibc' 'libxcb' 'libx11')
source_x86_64=("https://www.remoteutilities.com/download/viewer${pkgver}_amd64.deb")
sha256sums_x86_64=('da26d77f42a51a07da55033872179f51eb88313e8771b904c4da6d4f2a3b2996')


prepare() {
	[ -d data ] && rm -rf data
	mkdir data
	cd data
	for datatar in ../data.tar.*; do
		msg2 "Unpacking $datatar"
		tar -xf $datatar
	done
}

package() {
	ls ./data/
	cp -dr --no-preserve=ownership ./data/usr "${pkgdir}"/
}
