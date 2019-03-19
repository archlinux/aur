# Maintainer: Enihcam <gmail n a n e r i c w a n g>
# Contributor: Enihcam <gmail n a n e r i c w a n g>

pkgname=onedrive-bin
pkgver=2.2.1
pkgrel=1
pkgdesc='Free OneDrive client written in D'
arch=('x86_64')
url='https://github.com/abraunegg/onedrive'
license=('GPL3')
provides=('onedrive')
conflicts=('onedrive' 'onedrive-abraunegg-git')
depends=('liblphobos' 'gcc-libs' 'sqlite')
optdepends=('libnotify: notification support')
source=("http://download-ib01.fedoraproject.org/pub/fedora/linux/development/rawhide/Everything/x86_64/os/Packages/o/onedrive-${pkgver}-4.fc30.x86_64.rpm")
sha256sums=('3e7309729fb3a9649f8c41bb6de72cc89a4fd188e4e3c172ea741df3dbbb45f3')

package() {
    cp -a $srcdir/etc $pkgdir/etc
    cp -a $srcdir/usr $pkgdir/usr
    rm -fr $pkgdir/usr/lib/.build-id
    install -Dm644 "$pkgdir/usr/share/doc/onedrive/config" "$pkgdir/usr/share/onedrive/config.default"
}
