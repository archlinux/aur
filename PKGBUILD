# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof-bin
pkgver=4.1
pkgrel=1
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=()
provides=(sof)
conflicts=()
source=("${url}/releases/download/v4%2C1/sof-v${pkgver}-linux-amd64"
				"${url}/releases/download/v4%2C1/sof.1.gz")
noextract=("sof.1.gz")
sha256sums=("7461bb19eb61f56d089426b83506d4107e85f1f797f1d5a3fb0666814cc18cdd"
						"1dab231407c59a70e255e9080f987c8b89322bf17196e95e0c6fa257cf145fe0")

package() {
		install -Dm775 \
				sof-v${pkgver}-linux-amd64 \
				${pkgdir}/usr/bin/sof
		install -Dm644 \
				sof.1.gz \
				-t $pkgdir/usr/share/man/man1/
}
