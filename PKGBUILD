# Maintainer: Max Roder <maxroder@web.de>
# Contributor: ice-man <icemanf@gmail.com>

pkgname=mdcrack
pkgver=1.2
pkgrel=2
pkgdesc="MD4/MD5/NTLM1 hash cracker"
url="http://c3rb3r.openwall.net/mdcrack/"
arch=('i686' 'x86_64')
license=('unknown')
source=("http://c3rb3r.openwall.net/mdcrack/download/${pkgname}-${pkgver}.tar.gz"
	"mdcrack.patch")
sha256sums=('b68dec25170f177c70264c5a2863a70c28011f669db56a8825ae4ca28b1f5825'
            'b803e56979a23c501794dd1ab02c10bc1cecc4ab7531cb5bd2f75a4691260877')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	patch -Np1 < ../mdcrack.patch || return 1
	make little
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 bin/mdcrack ${pkgdir}/usr/bin/mdcrack
}
