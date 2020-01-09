# Maintainer: Eivind Eide <xenofil AT gmail DOT com>
# Contributor: Jim Pryor <jim AT jimpryor DOT net>

pkgname=members
pkgver=20080128
pkgrel=1
pkgdesc="Shows the members of a group; by default, all members"
arch=('x86_64')
depends=('gcc-libs')
url='https://packages.qa.debian.org/m/members.html'
license=('GPL')

source=("http://ftp.de.debian.org/debian/pool/main/m/members/${pkgname}_${pkgver}.1+nmu1.tar.xz"
        'LICENSE')
sha256sums=('334fed53fd3698f6fb644188550e0ff91769c63606bc189dd7a4380a3e6f8160'
            'c4855f8626ae06af0301e2d373832d0c27b8aa8db34457c3a3a7d334927e2fc0')

build() {
	cd "${pkgname}-${pkgver}.1+nmu1"

	make
}

package() {
	cd "${pkgname}-${pkgver}.1+nmu1"

	install -D -m 755 members -t "${pkgdir}/usr/bin"
	install -D -m 644 members.1 -t "${pkgdir}/usr/share/man/man1"
	install -D -m 644 "${srcdir}/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

