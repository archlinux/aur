# Maintainer: Johannes Seitz <aur-requests@seitz.email>

pkgname=remote-utilities-viewer
pkgver=1.0.26.b26
pkgrel=2
pkgdesc='Remote Utilities is highly configurable and secure remote desktop software for IT professionals'
arch=('x86_64')
url='https://www.remoteutilities.com/download/linux.php'
license=('custom')
options=('!strip')
provides=('remote-utilities-viewer')
conflicts=()
depends=('glibc' 'libxcb' 'libx11')
source_x86_64=("https://www.remoteutilities.com/download/viewer${pkgver}_amd64.deb")
sha256sums_x86_64=('c3268e24d22b9a1711491d9d21875f31c04d0f84e553391b300a82e0e1db068d')


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
