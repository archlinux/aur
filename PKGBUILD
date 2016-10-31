# Maintainer: Wes Barnett <wes at wbarnett dot us>
pkgname=snap-pac
pkgver=0.8.2
pkgrel=1
pkgdesc="Pacman hooks that use snapper to create pre/post btrfs snapshots like openSUSE's YaST"
arch=(any)
url="https://github.com/wesbarnett/snap-pac"
license=('GPL')
depends=(snapper)
source=(${url}/archive/${pkgver}.tar.gz
        ${url}/releases/download/${pkgver}/${pkgver}.tar.gz.sig)
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha256sums=('3f4ef4d571856ccec919b90fadc99b836f213b925f7a8ffc0de23de6e39ae2a1'
            'SKIP')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir install
}
