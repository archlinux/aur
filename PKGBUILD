# Maintainer : William Swanson <swansontec@gmail.com>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-logic"
pkgver="1.2.FC20C"
pkgrel=1
pkgdesc="Bitscope logic software for oscilloscopes"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')
depends=(atk gdk-pixbuf2 gtk2 pango cairo)

if [ "${CARCH}" == "x86_64" ]; then
    _BITSCOPEARCH='amd64'
    _BITSCOPESHA1='7444afaa0127c8da1126248e0fe1ec9b1ee08839'
else
    _BITSCOPEARCH='i386'
    _BITSCOPESHA1='9a6893080f144ed9b13f433cd07f68fb48ecdd7c'
fi

_DSOPKG="bitscope-logic_${pkgver}_${_BITSCOPEARCH}.deb"
source=("http://www.bitscope.com/download/files/${_DSOPKG}")
sha1sums=("${_BITSCOPESHA1}")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
