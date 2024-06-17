# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof-bin
pkgver=6.0
pkgrel=2
pkgdesc="Simple and fast calculate size of directories"
license=(GPL3)
url="https://codeberg.org/balaraz/sof"
arch=(x86_64)
depends=(gcc-libs)
makedepends=()
provides=(sof)
conflicts=()
source=("${url}/releases/download/v${pkgver}/sof-v${pkgver}-linux-amd64"
				"${url}/releases/download/v${pkgver}/sof.1.gz")
noextract=("sof.1.gz")
sha256sums=("b66aefbf1377a6bf527d17caa372fff17aecb09aa768659123beeb01df712253"
						"5e62835eead4e92cae5a2a050e26bba876faeb46e4cf1615b6e018123d0db3ae")

package() {
		install -Dm775 \
				sof-v${pkgver}-linux-amd64 \
				${pkgdir}/usr/bin/sof
		install -Dm644 \
				sof.1.gz \
				-t $pkgdir/usr/share/man/man1/
}
