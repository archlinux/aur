# Maintainer: Timothy Lee <timothy.ty.lee@gmail.com>
pkgname=libreoffice-extension-vrt-network-equipment
pkgver=1.2.0
pkgrel=2
pkgdesc='This extension provides galleries of network equipment shapes for LibreOffice, designed in a similar style to those offered by Microsoft Visio®.'
arch=('any')
url='http://www.vrt.com.au/downloads/vrt-network-equipment'
license=('CC-by-sa-v3')
groups=('libreoffice-extensions')
depends=('libreoffice') 
_pkgname=vrtnetworkequipment
_pkgver=1-2-0
source=("http://extensions.libreoffice.org/extension-center/vrt-network-equipment/releases/${pkgver}/${_pkgname}_${_pkgver}-lo.oxt")
noextract=(${source[@]##*/})
sha1sums=('30b3487811a1ff78c193d3426fa940d7a9e7cbbc')

package() {
    _DESTDIR="$pkgdir/usr/lib/libreoffice/share/extensions/$_pkgname" 
    install -dm755 "${_DESTDIR}"
    bsdtar -xf "$srcdir/${source[0]##*/}" -C "${_DESTDIR}"
    chmod -R g-w,o-w "${_DESTDIR}"
}
