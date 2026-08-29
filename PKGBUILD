# Maintainer: hosua <joshortiga777@gmail.com>
pkgname=claws-bin
_pkgname=claws
pkgver=0.18.0
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
sha256sums_x86_64=('a93869757952301c7b3f545bd851d596e7b3e91b1296bd9acac8cfc3551b9200')
sha256sums_aarch64=('5ade6d0023651543932cea3269753cca2190fd8e4a6f5f7a3ec0ba78405b871e')
options=('!strip' '!debug')

package() {
    install -Dm755 "$srcdir/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
