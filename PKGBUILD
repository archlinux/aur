# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof-bin
pkgver=4.3
pkgrel=1
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=()
provides=(sof)
conflicts=()
source=("${url}/releases/download/v${pkgver}/sof-v${pkgver}-linux-amd64"
				"${url}/releases/download/v${pkgver}/sof.1.gz")
noextract=("sof.1.gz")
sha256sums=("00697969ecf7e72a5eca66dff035d8e5deb35080488b656d5983c2e6e7341b29"
						"fe4c3e67ea9e1fb9fdcabe441093a7853306966343b7161dad56a7d56a2d3848")

package() {
		install -Dm775 \
				sof-v${pkgver}-linux-amd64 \
				${pkgdir}/usr/bin/sof
		install -Dm644 \
				sof.1.gz \
				-t $pkgdir/usr/share/man/man1/
}
