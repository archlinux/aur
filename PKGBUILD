# Maintainer: Stokes <jesusmanuelgonzalezmeneses18@gmail.com>

pkgname=educamadrid-nextcloud-bin
_pkgname=educamadrid-nextcloud
pkgver=0.3.0
pkgrel=1
pkgdesc="Unofficial GUI to add the EducaMadrid Nextcloud account to the Nextcloud desktop client on KDE Plasma (prebuilt binary)"
arch=('x86_64')
url="https://github.com/13Stokes31/educamadrid-nextcloud"
license=('MIT')
options=('!strip' '!debug')
depends=('dbus' 'nextcloud-client' 'kwallet' 'xdg-utils' 'gcc-libs' 'glibc' 'libglvnd' 'libx11' 'libxcursor' 'libxi'
         'libxkbcommon' 'libxkbcommon-x11' 'libxrender' 'wayland')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64-linux-gnu.tar.gz")
sha256sums=('0d97266818ef6962c39bdd3603ca1cc3fa364cd3c61835b7823beeddd2964009')

package() {
    cd "$_pkgname-$pkgver-x86_64-linux-gnu"
    install -Dm755 "$_pkgname" -t "$pkgdir/usr/bin/"
    install -Dm644 "$_pkgname.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
