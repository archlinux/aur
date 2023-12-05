# Maintainer: balaraz <balaraz@tuta.io>

pkgname=sof-bin
pkgver=3.0
pkgrel=2
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
sha256sums=("605f7662fefd37fa7b0e9014cda4601f8f73a95fae130c0fd44cb45f5d0945a9"
						"a4810b0c521ff3364f2e48afc68da130da29f9bf7852f9c695bea52f6fe499c3")

package() {
		install -Dm775 \
				sof-v${pkgver}-linux-amd64 \
				${pkgdir}/usr/bin/sof
		install -Dm644 \
				sof.1.gz \
				-t $pkgdir/usr/share/man/man1/
}
