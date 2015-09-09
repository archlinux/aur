# Maintainer: WhiteWind <whitearchey@gmail.com>

pkgname=2gis-beta
pkgver=4.15.2
pkgrel=1
pkgdesc="Beta version of Geographic Information System (GIS) for some Russian and Ukrainian cities."
arch=('i686' 'x86_64')
url=http://beta.2gis.ru/
license=(custom)
options=(!strip)
depends=('glibc>=2.15' 'libcups>=1.4.0' 'fontconfig>=2.9.0' 'freetype2>=2.3.5' 'gcc-libs>=4.2.1' 'libgl' 'glib2>=2.37.3' 'gst-plugins-base>=1.2.0' 'gstreamer>=1.0.0' \
'libice>=1.0.0' 'libjpeg>=8' 'libpng12>=1.2.13' 'libsm' 'sqlite>=3.5.9' 'libxcb' 'libxslt>=1.1.25' 'zlib>=1.2.0' 'icu52' 'xcb-util-renderutil')
install=$pkgname.install
source_i686=(http://deb.2gis.ru/pool/non-free/2/2gis/2gis_4.15.2-0trusty1+shv243+r4_i386.deb)
source_x86_64=(http://deb.2gis.ru/pool/non-free/2/2gis/2gis_4.15.2-0trusty1+shv243+r296_amd64.deb)
noextract=(${source[@]##*/})
sha256sums_i686=('db6ce1cb07918d9bdc50e13b6e434f8a16f6891f5d43f36fddf67e769ec08c70')
sha256sums_x86_64=('c7072ad720de218afb5f18922738d6dd5fb67580616dd12b7231529bfd56f652')
sha512sums_i686=('51daddffff55e5146eb816e28c53ab873ec20ecff9adfec471f33753e1e710cf74a63a90a020152406498ca5221ba4ca1951095a82e64ce0e300028efbc7d6de')
sha512sums_x86_64=('1fa65ba6c57ca23098c67e8c216bb41c6e916f658f46f5d80323100f68841c03ae7d0856df7ca30bf303761a97debe70db1a1ec45ab8f683ae43db3a10d34246')

package() {
    for i in *.deb; do
        bsdtar -Oxf $i data.tar.xz | bsdtar -C "$pkgdir" -xf -
    done
    mkdir -p $pkgdir/usr/share/licenses/2gis-beta
    mv $pkgdir/usr/share/doc/2gis/copyright $pkgdir/usr/share/licenses/2gis-beta/LICENCE
    rm -rf $pkgdir/usr/share/doc
}
