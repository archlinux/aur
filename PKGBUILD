# Maintainer : William Swanson <swansontec@gmail.com>
# Old maintainer : EnteEnteEnte <ducksource@duckpond.ch>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-dso"
pkgver="2.9.FE22G"
pkgrel=1
pkgdesc="Bitscope dso software for oscilloscopes"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')
depends=(atk gdk-pixbuf2 gtk2 pango cairo)

if [ "${CARCH}" == "x86_64" ]; then
    pkgver="2.9.FE22G"
    _BITSCOPEARCH='amd64'
    _BITSCOPESHA1='a6544b629de0042032a1629a463943d389b30651'
else
    pkgver="2.9.FE22H"
    _BITSCOPEARCH='i386'
    _BITSCOPESHA1='8cdd8f84a87cdeb19cf6ccee9527d267845712d0'
fi

_DSOPKG="bitscope-dso_${pkgver}_${_BITSCOPEARCH}.deb"
source=("http://www.bitscope.com/download/files/${_DSOPKG}")
sha1sums=("${_BITSCOPESHA1}")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
