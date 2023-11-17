# Maintainer: Chimmie Firefly <gameplayer2019pl (at) tutamail (dot) com>
pkgname=tlapbot-bin
_pkgname=tlapbot-bin
pkgver=rde9ab909380391fec12063082a836a728f897c11
pkgrel=1
pkgdesc='Owncast bot written in Python+Flask, providing channel points and channel point redeems for your owncast stream.'

arch=(
	'x86_64'
)

url="https://tlapbot.chimmie.k.vu"
license=(
	'GPL3'
	'no-license'
)

depends=(
    'openssl'
    'glibc'
)

makedepends=(
    'pacman'
)

provides=(
	'tlapbot'
)

conflicts=(
	'tlapbot'
)

source=(
    "https://tlapbot.chimmie.k.vu/dists/ubuntu/tlapbot"
)

sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}"
    echo 'r'"$(sha1sum tlapbot | cut -d ' ' -f 1)"
}

build() {
	cd "${srcdir}"
	ls tlapbot
}

package() {
    cd "${srcdir}"
    mkdir -p "${pkgdir}/usr/bin" 2>/dev/null 3>&2
    cp -rvL tlapbot "${pkgdir}/usr/bin"
    chmod +x "${pkgdir}"/usr/bin/*
}
