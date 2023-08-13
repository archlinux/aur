# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

pkgname='jq.sh'
pkgver='1.0.0'
pkgrel='1'
pkgdesc='jq-in-shell integration library'
arch=('any')
url='https://git.stefanwimmer128.io/stefanwimmer128/jq.sh'
license=('MPL2')
depends=('sh' 'jq' 'moreutils')
makedepends=('git' 'shellcheck' 'shellspec' 'getoptions')
optdepends=('yq: Adds support for yq, xq and tomlq')
source=("$pkgname::git+https://git.stefanwimmer128.io/stefanwimmer128/jq.sh.git#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('8F3EBD3D92A3F8889867D14F96D7B3B5CF717997')

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
