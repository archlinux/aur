# Maintainer: Wes Barnett <wes at wbarnett dot us>
pkgname=snap-pac
pkgver=0.7
pkgrel=1
pkgdesc="Pacman hooks that use snapper to create pre/post btrfs snapshots like openSUSE's YaST"
arch=(any)
url="https://github.com/wesbarnett/snap-pac"
license=('GPL')
depends=(snapper)
checkdepends=(shellcheck)
source=(${url}/archive/${pkgver}.tar.gz
        ${url}/releases/download/${pkgver}/${pkgver}.tar.gz.sig)
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha256sums=('d401c526579402cd1e8634a1347af72ba6c0fca608e658cfcb5e03ceaeaa3608'
            'SKIP')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}

check() {
    cd "$pkgname-$pkgver"
    make check
}
