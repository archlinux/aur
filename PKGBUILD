# Maintainer: NicoHood <archlinux {cat} nicohood {dog} de>
# PGP ID: 97312D5EB9D7AE7D0BD4307351DAE9B7C1AE9161
# Contributor: Wes Barnett <wes at wbarnett dot us>
pkgname=snap-sync
pkgver=0.5
pkgrel=1
pkgdesc="Use snapper snapshots to backup to external drive"
arch=(any)
url="https://github.com/wesbarnett/snap-sync"
license=('GPL2')
depends=(snapper libnotify)
install='snap-sync.install'
source=("${url}/releases/download/${pkgver}/${pkgname}-${pkgver}.tar.gz"{,.sig}
        'snap-sync.install')
validpgpkeys=('8535CEF3F3C38EE69555BF67E4B5E45AA3B8C5C3')
sha512sums=('006c7593a5f345236e6aae6b91d813b8c37521833d347bbccda750b1c398d32fbca25591182ae27cae13c43239e3b13015add46b9aab9592d32e7baa9a71aec2'
            'SKIP'
            '39b4e05794657b880a81d8060f34a6a703db8169b68963aa1cc32e428a7a593b2d65dc6eb1f3fe37b7a0f2967c02113d1368b5d090341ed3856871d141013590')

package() {
    cd "${pkgname}"
    make SNAPPER_CONFIG=/etc/conf.d/snapper DESTDIR="${pkgdir}" install
}
