# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Past maintainer: Evan Teitelman <teitelmanevan@gmail.com>
# Contributor: Tilmann Becker <tilmann.becker@freenet.de>

pkgname=scrounge-ntfs
pkgver=0.9
pkgrel=6
pkgdesc="Data recovery program for NTFS file systems"
arch=('i686' 'x86_64')
url="http://thewalter.net/stef/software/scrounge/"
license=('BSD')
groups=()
depends=()
makedepends=('autoconf' 'automake')
provides=()
conflicts=()
replaces=()
backup=()
install=
source=("http://thewalter.net/stef/software/scrounge/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.sig")
noextract=()
sha512sums=('7d8ba55a8e95b83d0eee5a0f540d22ec572d9724f32d64aec9f3e817b32fcc5d4502979ccd61b1d98adbd559c361d69dc2a288d02de7945855ce51c36c452b07'
            'SKIP')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	./configure --prefix=/usr --sbindir=/usr/bin
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
