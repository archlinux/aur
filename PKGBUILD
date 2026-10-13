# Maintainer: AkitaOnRails <boss@akitaonrails.com>

# NOTE: pkgver/pkgrel and the sha256sums below are PLACEHOLDERS — rewritten by
# `.github/workflows/release.yml` at publish time, exactly like PKGBUILD.
pkgname=omarchy-cheatsheets-bin
_pkgname=omarchy-cheatsheets
pkgver=0.3.0
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
sha256sums_x86_64=('cc12557bb76f30897bb835d9a9846d8436427ac851b8390954a9e1a24076062e')
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz")
sha256sums_aarch64=('eeea5d3d3db0ecfebb51741273c035615b603c037c3b829509bf807de716cfe6')

package() {
    install -Dm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm0644 omarchy-cheatsheets.desktop \
        "$pkgdir/usr/share/applications/omarchy-cheatsheets.desktop"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
