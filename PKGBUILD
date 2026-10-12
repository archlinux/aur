# Maintainer: AkitaOnRails <boss@akitaonrails.com>

# NOTE: pkgver/pkgrel and the sha256sums below are PLACEHOLDERS — rewritten by
# `.github/workflows/release.yml` at publish time, exactly like PKGBUILD.
pkgname=omarchy-cheatsheets-bin
_pkgname=omarchy-cheatsheets
pkgver=0.1.1
pkgrel=1
pkgdesc="Pretty, searchable Neovim/tmux/etc cheatsheets for Omarchy Linux (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/omarchy-cheatsheets"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'qt6-base' 'qt6-declarative')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-debug")
options=('!strip' '!debug')

source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
sha256sums_x86_64=('6874f6252aaefa6a56c5fcb8bfa8634ed5171b2f8ebc9ea5b5f27b66afe2e74e')
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz")
sha256sums_aarch64=('0017629f1b9d063a1a75da1604a2d44bda4ff6fc90b270666edd930c276a9bdc')

package() {
    install -Dm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm0644 omarchy-cheatsheets.desktop \
        "$pkgdir/usr/share/applications/omarchy-cheatsheets.desktop"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
