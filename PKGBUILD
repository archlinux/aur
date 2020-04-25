# Maintainer: Librewish <librewish@gmail.com>
# Contributer : Philip Müller <philm[at]manjaro[dog]org>
# Contributer : Roland Singer <roland[at]manjaro[dog]org>

pkgname=('mhwd-ati')
pkgver=19.1.0
pkgrel=1

pkgdesc="MHWD module-ids for ati $pkgver"
arch=('any')
url="http://xorg.freedesktop.org/"
license=('custom')
source=(${url}/releases/individual/driver/xf86-video-ati-${pkgver}.tar.bz2 mhwd-ati)

sha256sums=('659f5a1629eea5f5334d9b39b18e6807a63aa1efa33c1236d9cc53acbb223c49'
            '98ff6b7a8cc0b69ebf1e7b6b04a15717e9d8aae43d9b771b3ac83a5f4d44e157')

package() {
    install -d -m755 "${pkgdir}/var/lib/mhwd/ids/pci/"
    # Generate mhwd database
    sh -e ${srcdir}/mhwd-ati \
    ${srcdir}/xf86-video-ati-$pkgver/src/pcidb/ati_pciids.csv \
    > ${pkgdir}/var/lib/mhwd/ids/pci/ati.ids
}
