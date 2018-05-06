# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: Wes Barnett <wes at wbarnett dot us>
pkgname=snap-sync
pkgver=0.4.2
pkgrel=3
pkgdesc="Use snapper snapshots to backup to external drive"
arch=(any)
url="https://github.com/wesbarnett/snap-sync"
license=('GPL2')
depends=(snapper libnotify)
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.sig})
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha512sums=('bc7dc618874f2acc6e15f80960fa45c5703b0da709e3872febe1579d6965907074aca4704dbcc2545261392c1bff977a2b81d2a15e6850fefa3cd7c231f0290c'
            'SKIP')

package() {
    cd "${pkgname}"
    make SNAPPER_CONFIG=/etc/conf.d/snapper DESTDIR="${pkgdir}" install
}
