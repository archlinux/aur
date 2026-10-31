# Maintainer: hosua <joshortiga777@gmail.com>
pkgname=claws-bin
_pkgname=claws
pkgver=0.18.1
pkgrel=1
pkgdesc="k9s-inspired TUI for AWS resource management with vim-style navigation (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/clawscli/claws"
license=('Apache-2.0')
depends=('glibc')
optdepends=('xclip: clipboard support on X11'
            'wl-clipboard: clipboard support on Wayland')
provides=("$_pkgname")
conflicts=("$_pkgname")
source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-amd64.tar.gz")
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-arm64.tar.gz")
sha256sums_x86_64=('c89ed8cf8e1a9e6ad64eaef539dc789b749b467c63bf7530bfd46bdbc497f70b')
sha256sums_aarch64=('dd16b1f9e437e01d6228b736a16746e0ddd637b1b68ff9ad229d62396d6713bd')
options=('!strip' '!debug')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
