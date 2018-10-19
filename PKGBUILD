# Maintainer : Marco Camilli <marco@emavap.be>
# Old Maintainer : William Swanson <swansontec@gmail.com>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-dso"
pkgver="2.8.FE22H"
pkgrel=1
pkgdesc="Bitscope dso software for oscilloscopes"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')
depends=(atk gdk-pixbuf2 gtk2 pango cairo)

if [ "${CARCH}" == "x86_64" ]; then
    _BITSCOPEARCH='amd64'
    _BITSCOPESHA1='8a430dca83efe9ae330ec12515ce5439d582eb1f'
else
    _BITSCOPEARCH='i386'
    _BITSCOPESHA1='d2875a326793fdf93ca22d354df62685e7056325'
fi

_DSOPKG="bitscope-dso_${pkgver}_${_BITSCOPEARCH}.deb"
source=("http://www.bitscope.com/download/files/${_DSOPKG}")
sha1sums=("${_BITSCOPESHA1}")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
