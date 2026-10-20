# Maintainer: AkitaOnRails <boss@akitaonrails.com>

# NOTE: pkgver/pkgrel and the sha256sums below are PLACEHOLDERS — rewritten by
# `.github/workflows/release.yml` at publish time, exactly like PKGBUILD.
pkgname=omarchy-cheatsheets-bin
_pkgname=omarchy-cheatsheets
pkgver=0.6.0
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
sha256sums_x86_64=('29ba5c4a4d4b41e21caa22534031afed6b006d38b74975f196d84e41e1c3c237')
source_aarch64=("$_pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-linux-aarch64.tar.gz")
sha256sums_aarch64=('f99dd206fb204d75b6cabe3107cb1a750e243341197b0b0df5088e53bd8064e2')

package() {
    install -Dm0755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm0644 omarchy-cheatsheets.desktop \
        "$pkgdir/usr/share/applications/omarchy-cheatsheets.desktop"
    install -Dm0644 README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"
}
