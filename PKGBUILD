# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof-bin
pkgver=5.0
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
sha256sums=("b43febc926a95f772bbe876462c660d6d8cc9dd623950db6a3e55c41caa04ce3"
						"dd7772584f6297238e6ba6de27b99b64e44ffe1e04ff9f46dce6c630c8f3fb75")

package() {
		install -Dm775 \
				sof-v${pkgver}-linux-amd64 \
				${pkgdir}/usr/bin/sof
		install -Dm644 \
				sof.1.gz \
				-t $pkgdir/usr/share/man/man1/
}
