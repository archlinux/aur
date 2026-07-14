# Maintainer: Johannes Seitz <aur-requests@seitz.email>

pkgname=remote-utilities-viewer
pkgver=1.0.27.b27
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
sha256sums_x86_64=('3d2b625e2995da90ba087f73ccafce951e0548b542650d2ab23276c7e0eac500')


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
