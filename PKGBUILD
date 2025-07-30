# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
pkgname="chromashift"
pkgver=2.0.0
pkgrel=1
pkgdesc="A output colorizer for your favorite commands"
arch=("x86_64")
url="https://github.com/Nadim147c/ChromaShift"
license=('GPL-3.0')
makedepends=('go')
provides=("$pkgname")
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('31dc9a09f002635c923ea8fc4f9afa361c6d9f1c24811295f6a23de0d414777d')

build() {
	cd "ChromaShift-${pkgver}" || return
	make build
}

package() {
	cd "ChromaShift-${pkgver}" || return
	make install PREFIX="$pkgdir/usr"
}
