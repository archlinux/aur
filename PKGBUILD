# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof-bin
pkgver=4.0
pkgrel=1
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=()
makedepends=()
provides=(sof)
conflicts=()
source=("${url}/releases/download/v4%2C0/sof-v${pkgver}-linux-amd64"
				"${url}/releases/download/v4%2C0/sof.1.gz")
noextract=("sof.1.gz")
sha256sums=("812ae2755a8b0cb51b84ddf8024bad1f7bf98458bb85132938fdca765fe63130"
						"efb50d1d3a7fda5cc5f87faa898e0b3a3efe906dcc623703ba8c5ba432872f79")

package() {
		install -Dm775 \
				sof-v${pkgver}-linux-amd64 \
				${pkgdir}/usr/bin/sof
		install -Dm644 \
				sof.1.gz \
				-t $pkgdir/usr/share/man/man1/
}
