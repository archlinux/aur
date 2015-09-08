# Maintainer: WhiteWind <whitearchey@gmail.com>

pkgname=2gis-beta
pkgver=4.15.2
pkgrel=1
pkgdesc="Beta version of Geographic Information System (GIS) for some Russian and Ukrainian cities."
arch=('i686' 'x86_64')
url=http://beta.2gis.ru/
license=(custom)
depends=('glibc>=2.15' 'libcups>=1.4.0' 'fontconfig>=2.9.0' 'freetype2>=2.3.5' 'gcc-libs>=4.2.1' 'libgl' 'glib2>=2.37.3' 'gst-plugins-base>=1.2.0' 'gstreamer>=1.0.0' \
'libice>=1.0.0' 'libjpeg>=8' 'libpng12>=1.2.13' 'libsm' 'sqlite>=3.5.9' 'libxcb' 'libxslt>=1.1.25' 'zlib>=1.2.0' 'icu52' 'xcb-util-renderutil')
install=$pkgname.install
source_i686=(http://deb.2gis.ru/pool/non-free/2/2gis/2gis_4.15.2-0trusty1+shv243+r4_i386.deb)
source_x86_64=(http://deb.2gis.ru/pool/non-free/2/2gis/2gis_4.15.2-0trusty1+shv243+r296_amd64.deb)
noextract=(${source[@]##*/})
md5sums_i686=('4868b53129c23ead423fbc15587b99b1')
md5sums_x86_64=('ae4b82fa97fd459d1074bca0e9617be4')

package() {
    for i in *.deb; do
        bsdtar -Oxf $i data.tar.xz | bsdtar -C "$pkgdir" -xf -
    done
    mkdir -p $pkgdir/usr/share/licenses/2gis-beta
    mv $pkgdir/usr/share/doc/2gis/copyright $pkgdir/usr/share/licenses/2gis-beta/LICENCE
    rm -rf $pkgdir/usr/share/doc
}
