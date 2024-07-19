# Maintainer: Stefan Wimmer <info@stefanwimmer128.xyz>

pkgname='jq.sh'
pkgver='1.0.1'
pkgrel='1'
pkgdesc='jq-in-shell integration library'
arch=('any')
url='https://gitlab.com/stefanwimmer128/jq.sh'
license=('MPL2')
depends=('sh' 'jq' 'moreutils')
makedepends=('git' 'shellcheck' 'shellspec' 'getoptions')
optdepends=('yq: Adds support for yq, xq and tomlq')
source=("$pkgname::git+https://gitlab.com/stefanwimmer128/jq.sh.git#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"

    make
}

check() {
    cd "$pkgname"

    make check
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" PREFIX=/usr install
}
