# Maintainer: Prabhat Kumar <hi@prbhtkumr.xyz>
pkgname=gaur-bin
pkgver=1.1.0
pkgrel=1
pkgdesc="A beautiful, interactive TUI for Arch Linux package management (prebuilt binary)"
arch=('x86_64')
url="https://github.com/prbhtkumr/gaur"
license=('GPL-3.0-only')
depends=('fzf' 'pacman-contrib' 'glibc')
optdepends=(
    'paru: AUR helper (recommended)'
    'yay: AUR helper (alternative)'
    'reflector: mirror list updates'
)
provides=('gaur')
conflicts=('gaur')
source=("gaur-$pkgver::https://github.com/prbhtkumr/gaur/releases/download/v$pkgver/gaur-linux-x86_64"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/prbhtkumr/gaur/v$pkgver/LICENSE")
sha256sums=('5e6b5d77d85f592a6f35eb1d314aedbc6d08585a18260b63cf5e7803b3305ce1'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986')

package() {
    install -Dm755 "gaur-$pkgver" "$pkgdir/usr/bin/gaur"
    install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
