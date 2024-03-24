# Maintainer: Tim Harding <tim@timharding.co>

pkgname='neophyte-bin'
pkgver='0.2.4'
pkgrel=1
pkgdesc='A WebGPU-rendered Neovim GUI'
arch=('x86_64')
url='https://github.com/tim-harding/neophyte'
license=('MIT')
depends=('fontconfig' 'gcc-libs' 'glibc')
provides=("neophyte=$pkgver")
conflicts=('neophyte' 'neophyte-git')
source=(
    "neophyte::$url/releases/download/$pkgver/neophyte-linux"
    'LICENSE::https://www.mit.edu/~amini/LICENSE.md'
)
sha256sums=('d09d2a73fcfb5db2400c172454bc8f5c04f18749aedb9b32bb3b9c1c883ef12d'
            '92cc8f8ab5ab620c6dc2c9a45bb3faf66b56f422615c9f96bc315f4dea71620c')

# Update checksums with `updpkgsums` from `pacman-contrib`
# Update .SRCINFO with `makepkg --printsrcinfo > .SRCINFO`
# TODO: Add licenses, readme, and desktop file to releases in CI

package() {
    install \
        --mode=0755 \
        -D --target-directory="$pkgdir/usr/bin/" \
        neophyte

    install \
        --mode=0644 \
        -D --target-directory="$pkgdir/usr/share/licenses/$pkgname/" \
        LICENSE
}

# vim: ts=4 sts=4 sw=4 et
