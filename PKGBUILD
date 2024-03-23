# Maintainer: Tim Harding <tim@timharding.co>

pkgname='neophyte-bin'
pkgver='0.2.4'
pkgrel=1
pkgdesc="A WebGPU-rendered Neovim GUI"
arch=('x86_64')
url="https://github.com/tim-harding/neophyte"
license=('MIT')
provides=("neophyte=$pkgver")
conflicts=('neophyte' 'neophyte-git')
source=(
    "neophyte::$url/releases/download/$pkgver/$pkgname-linux"
    "README.md::$url"
)
sha256sums=('SKIP') # TODO: Add checksums

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

# vim: ts=4 sts=4 sw=4 et
