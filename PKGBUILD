# Maintainer: Stokes <jesusmanuelgonzalezmeneses18@gmail.com>

pkgname=educamadrid-wifi-bin
_pkgname=educamadrid-wifi
pkgver=0.2.1
pkgrel=1
pkgdesc="Unofficial GUI to connect to the EducaMadrid WEDU_PROF Wi-Fi network via NetworkManager (prebuilt binary)"
arch=('x86_64')
url="https://github.com/13Stokes31/educamadrid_wifi"
license=('MIT')
options=('!strip' '!debug')
depends=('networkmanager' 'gcc-libs' 'glibc' 'libglvnd' 'libx11' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libxrender' 'wayland')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-linux-gnu.tar.gz")
sha256sums=('0470ab789d7ddbbea3e76016a8590218b087e797907ee2ad6ed72f8721daefa2')

package() {
    cd "$_pkgname-$pkgver-x86_64-linux-gnu"
    install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
