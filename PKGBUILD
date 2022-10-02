# Maintainer: Matthias Gatto <uso.cosmo.ray at gmail dot com>

pkgname=json-search-git
pkgver=r40.a741413
pkgrel=1
pkgdesc='Util to seach though json files'

arch=('x86_64' 'aarch64')

licence=("custom:WTFPL")

pkgver() {
	 cd "${srcdir}/json-search"
	 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

makedepends=(gcc make git)

depends=(json-c)

source=(git+https://github.com/cosmo-ray/json-search.git)
sha256sums=("SKIP")

build() {
    cd "${srcdir}/json-search"
    ./configure
    make
}

package() {
    cd "${srcdir}/json-search"
    install -D "${srcdir}/json-search/json-search" "$pkgdir/usr/bin/json-search"
    install -D "${srcdir}/json-search/LICENSE" "$pkgdir/usr/share/licenses/json-search/LICENSE"
}



