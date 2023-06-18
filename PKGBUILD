# Maintainer: stefanwimmer128 <info at stefanwimmer128 dot eu>

pkgname='jq.sh'
pkgver='0.4.0'
pkgrel='1'
pkgdesc='jq-in-shell integration library'
arch=('any')
url='https://git.stefanwimmer128.io/stefanwimmer128/jq.sh'
license=('MPL2')
depends=('sh' 'jq' 'moreutils')
makedepends=('git' 'shellcheck' 'shellspec')
optdepends=('yq: Adds support for yq, xq and tomlq')
source=("$pkgname::git+https://git.stefanwimmer128.io/stefanwimmer128/jq.sh.git#tag=v$pkgver?signed")
sha256sums=('SKIP')

check() {
    cd "$pkgname"

    make check
}

package() {
    cd "$pkgname"

    make DESTDIR="$pkgdir" install
}
