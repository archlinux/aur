# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: Wes Barnett <wes at wbarnett dot us>
pkgname=snap-sync
pkgver=0.6.1
pkgrel=2
pkgdesc="Use snapper snapshots to backup to external drive"
arch=(any)
url="https://github.com/wesbarnett/snap-sync"
license=('GPL2')
depends=(snapper libnotify)
install='snap-sync.install'
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.sig}
        'snap-sync.install')
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3'  # old key
              'F7B28C61944FE30DABEEB0B01070BCC98C18BD66') # new ecc key
sha512sums=('99ba7c1e9c075bf78103d6398cee5988c5f6437248f06ce05a4cab78e8e1c737461bd9a6948105087ec3beb9192b00004dde8952a99352f78ff1f1da753f12e5'
            'SKIP'
            '39b4e05794657b880a81d8060f34a6a703db8169b68963aa1cc32e428a7a593b2d65dc6eb1f3fe37b7a0f2967c02113d1368b5d090341ed3856871d141013590')

package() {
    cd "${pkgname}"
    make SNAPPER_CONFIG=/etc/conf.d/snapper DESTDIR="${pkgdir}" install
}
