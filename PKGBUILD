
# Maintainer: acd2048@proton.me

pkgname=eedid-tool
pkgver=0.0.1
#remember to regen .SRCINFO
pkgrel=1
pkgdesc="A tool to scan, read, write (E-)EDIDs on Linux using the i2c-dev driver."
arch=('x86_64')
url="https://git.sr.ht/~acd2048/eedid-tool"
license=('GPL-3.0-or-later')
#GPL-3.0-only
groups=()
depends=('glibc' 'i2c-tools')
makedepends=('gzip')
source=("${pkgname}-${pkgver}.tar.gz::https://git.sr.ht/~acd2048/eedid-tool/archive/v0.0.1.tar.gz")
noextract=()
sha256sums=('48520e0840da2141d945efcd561226086e4c50fb08032baaf9d15a757efd016d')



prepare() {
	cd "$srcdir/${pkgname}-v${pkgver}"
	chmod +x make.sh
	chmod +x install.sh
}

build() {
	cd "$srcdir/${pkgname}-v${pkgver}"
	./make.sh
}


package() {
	cd "$srcdir/${pkgname}-v${pkgver}"
	#make DESTDIR="$pkgdir/" install
	export DESTDIR="${pkgdir}"
	./install.sh
}
