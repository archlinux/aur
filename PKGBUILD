# Maintainer : William Swanson <swansontec@gmail.com>
# vim: set ts=2 sw=2 et:

pkgname="bitscope-server"
pkgver="1.1.FK26A"
pkgrel=1
pkgdesc="Network server software for Bitscope oscilloscopes"
arch=('i686' 'x86_64')
url="http://www.bitscope.com"
license=('custom')
depends=()

if [ "${CARCH}" == "x86_64" ]; then
    _BITSCOPEARCH='amd64'
    _BITSCOPESHA1='0e05f666c35b5338125eb7dd8cf2a5d4e9ec7995'
else
    _BITSCOPEARCH='i386'
    _BITSCOPESHA1='fa009f019192d8522666789a21ed7ca1d127a403'
fi

_DSOPKG="bitscope-server_${pkgver}_${_BITSCOPEARCH}.deb"
source=("http://www.bitscope.com/download/files/${_DSOPKG}")
sha1sums=("${_BITSCOPESHA1}")

package() {
   tar -xzf "${srcdir}/data.tar.gz" -C "${pkgdir}"
}
