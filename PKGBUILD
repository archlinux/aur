# Maintainer: instantOS <hello@instantos.io>
pkgname=instantmenu-bin
_pkgname=instantmenu
pkgver=5.2.3
pkgrel=1
pkgdesc="A dynamic menu for X11 and Wayland (prebuilt binary)"
arch=('x86_64')
url="https://github.com/instantOS/instantMENU"
license=('MIT')
# Match the source package's epoch for versioned dependencies.
provides=("$_pkgname=1:$pkgver")
conflicts=('instantmenu')
depends=('bash' 'fontconfig' 'gcc-libs' 'glibc' 'libxcb' 'libxkbcommon-x11')
source=("$url/releases/download/v$pkgver/$_pkgname-x86_64-unknown-linux-gnu-v$pkgver.tgz")
sha256sums=('c90bd0ace275b2c28d712bf79245c9d74e344c5581d1857994744b31f8a05649')

package() {
    cd "$_pkgname-x86_64-unknown-linux-gnu-v$pkgver"
    install -Dm755 instantmenu "$pkgdir/usr/bin/instantmenu"
    install -Dm755 itest "$pkgdir/usr/bin/itest"
    install -Dm755 instantmenu_path "$pkgdir/usr/bin/instantmenu_path"
    install -Dm755 instantmenu_run "$pkgdir/usr/bin/instantmenu_run"
    install -Dm644 instantmenu.1 "$pkgdir/usr/share/man/man1/instantmenu.1"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
