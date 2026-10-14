# Maintainer: AkitaOnRails <boss@akitaonrails.com>

# NOTE: pkgver/pkgrel and the sha256sums below are PLACEHOLDERS — rewritten by
# `.github/workflows/release.yml` at publish time, exactly like PKGBUILD.
pkgname=omarchy-cheatsheets-bin
_pkgname=omarchy-cheatsheets
pkgver=0.5.0
pkgrel=1
pkgdesc="Pretty, searchable Neovim/tmux/etc cheatsheets for Omarchy Linux (prebuilt binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/akitaonrails/omarchy-cheatsheets"
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'qt6-base' 'qt6-declarative')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-debug")
install=omarchy-cheatsheets.install
options=('!strip' '!debug')

source_x86_64=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-x86_64.tar.gz")
sha256sums_x86_64=('2391a170937c799f077b1b72eb1d7d8bca161c641e56c81bb1bb09a0a0d0a0fa')
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz")
sha256sums_aarch64=('481cbe3681f700b48cac3f0e898372b7deea15da5a7451f05532e5a480d1279e')

package() {
    install -Dm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm0644 omarchy-cheatsheets.desktop \
        "$pkgdir/usr/share/applications/omarchy-cheatsheets.desktop"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
