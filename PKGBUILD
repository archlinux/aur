# Maintainer: Chimmie Firefly <gameplayer2019pl (at) tutamail (dot) com>
pkgname=echeai-cli-git
_pkgname=echeai-cli-git
pkgver=0
pkgrel=1
pkgdesc='Provides a CLI access to Echedey ChatAI Service.'

arch=(
	'any'
)

url="https://eche.chimmie.k.vu"
license=('MIT')

depends=(
    'sed'
    'curl'
    'coreutils'
)

makedepends=(
    'pacman'
)

provides=(
	'echeai-cli'
)

conflicts=(
	'echeai-cli'
)

source=(
    "https://eche.chimmie.k.vu/packages/zst/pkg.tar.gz"
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
