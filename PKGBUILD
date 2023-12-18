# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof-bin
pkgver=3.2
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
sha256sums=("f29937e14dd9cb34995bce458bb999ffa2ea90479b8a211aff079e2c89dec779"
						"f659b90780b361ee13eb8063804eed4361d663fb01f6295cc02e1307652379bb")

package() {
		install -Dm775 \
				sof-v${pkgver}-linux-amd64 \
				${pkgdir}/usr/bin/sof
		install -Dm644 \
				sof.1.gz \
				-t $pkgdir/usr/share/man/man1/
}
