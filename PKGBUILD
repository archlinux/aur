# Maintainer: Wes Barnett <wes at wbarnett dot us>
pkgname=snap-pac
pkgver=0.6.1
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
sha256sums=('b658e533a6ff5fbf4acfaa09530f63d62226c9390faaabc47aaf70a3941faede'
            'SKIP')

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR=$pkgdir PREFIX=/usr install
}

check() {
    cd "$pkgname-$pkgver"
    make check
}
