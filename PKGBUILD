# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
pkgname="chromashift"
pkgver=2.0.1
pkgrel=1
pkgdesc="A output colorizer for your favorite commands"
arch=("x86_64")
url="https://github.com/Nadim147c/ChromaShift"
license=('GPL-3.0')
makedepends=('go')
provides=("$pkgname")
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('39e432d0ee1b98ca7f25064c075efbe1a74db10672ada7c62851817ef835ea57')

build() {
	cd "ChromaShift-${pkgver}" || return
	make build
}

package() {
	cd "ChromaShift-${pkgver}" || return
	make install PREFIX="$pkgdir/usr"
}
