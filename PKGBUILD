# Maintainer : William Swanson <swansontec@gmail.com>
# Old maintainer : EnteEnteEnte <ducksource@duckpond.ch>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-meter"
pkgver="2.0.FK22G"
pkgrel=1
pkgdesc="Bitscope meter software for oscilloscopes"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')
depends=(atk gdk-pixbuf2 gtk2 pango cairo)

if [ "${CARCH}" == "x86_64" ]; then
    _BITSCOPEARCH='amd64'
    _BITSCOPESHA1='0b90484c732478672a27306a2778fdd8e56f7df2'
else
    _BITSCOPEARCH='i386'
    _BITSCOPESHA1='5f78841fe3069c6d0bdca025e1e449b686349e0c'
fi

_METERPKG="bitscope-meter_${pkgver}_${_BITSCOPEARCH}.deb"
source=("http://www.bitscope.com/download/files/${_METERPKG}")
sha1sums=("${_BITSCOPESHA1}")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
