# Maintainer: Chimmie Firefly <gameplayer2019pl (at) tutamail (dot) com>
pkgname=markdown-html-git
_pkgname=markdown-html-git
pkgver=0
pkgrel=1
pkgdesc='A Shell-based markdown to html solution.'

arch=(
	'any'
)

url="https://markdown.chimmie.k.vu"
license=('Akini 3.1')

depends=(
    'sed'
    'gawk'
    'coreutils'
)

makedepends=(
    'pacman'
)

provides=(
	'markdown-html'
)

conflicts=(
	'markdown-html'
)

source=(
    "https://markdown.chimmie.k.vu/packages/zst/pkg.tar.gz"
)

noextract=("pkg.tar.gz")

sha256sums=(
    'SKIP'
)

pkgver() {
    cd "${srcdir}"
    echo 'r'"$(sha256sum pkg.tar.gz | cut -d ' ' -f 1)"
}

build() {
	cd "${srcdir}"
	tar -xvf pkg.tar.gz
    mv default-fs "${pkgname}"
    
}

package() {
    cd "${srcdir}"
	cd "${srcdir}/${pkgname}"
    mkdir -p "${pkgdir}" 2>/dev/null 3>&2
    cp -rv * "${pkgdir}/"
    chmod +x "${pkgdir}"/usr/bin/*
}
