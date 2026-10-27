# Maintainer: Eleanor Kelley <me at eleanorkelley dot com>

_pkgname=hledger-simplefin
pkgname=$_pkgname-git
pkgver=r11.ea8ec42
pkgrel=1
pkgdesc="SimpleFIN helper scripts for hledger"
arch=(any)
url="https://github.com/eleanor-k/hledger-simplefin"
license=('GPL-3.0-or-later')
depends=(
    'bash'
    'coreutils'
    'curl'
    'jq'
    'libsecret'
    'python3'
)
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/eleanor-k/hledger-simplefin.git")
b2sums=('SKIP')
pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
package() {
    install -Dm755 $_pkgname/simplefincsv "$pkgdir"/usr/bin/simplefincsv
    install -Dm755 $_pkgname/simplefinjson "$pkgdir"/usr/bin/simplefinjson
    install -Dm755 $_pkgname/simplefinsetup "$pkgdir"/usr/bin/simplefinsetup
}

