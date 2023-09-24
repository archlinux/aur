# Maintainer: Leon Möller <jkhsjdhjs at totally dot rip>

pkgname="jellyfin-web-intro-skipper"
pkgver=10.8.10
_commit=4d9c94b8f109435b68ea864bcea3bc41dfceb128
pkgrel=1
pkgdesc="Modified jellyfin web client to use with the 'Intro Skipper' plugin"
arch=('any')
url="https://github.com/ConfusedPolarBear/jellyfin-web"
license=('GPL2')
provides=("${pkgname%-intro-skipper}=$pkgver")
conflicts=("${pkgname%-intro-skipper}")
makedepends=('git' 'npm')
source=("$pkgname::git+$url.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    npm ci --no-audit
}

package() {
    mkdir -p "$pkgdir"/usr/lib/jellyfin
    cp -r "$pkgname/dist" "$pkgdir/usr/lib/jellyfin/jellyfin-web"
}
