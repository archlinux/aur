# Maintainer: ninian <mcfadzean.org.uk ta linux>

pkgname=cdck-bin
_debname=${pkgname%-bin}
_debrepo='http://ftp.debian.org/debian/pool/main/c/'
_debrel='+dfsg-1'
pkgver=0.7.0
pkgrel=1
pkgdesc="Command-line tool for verifying the quality of a written CD or DVD"
arch=('i686' 'x86_64')
url="http://swaj.net/unix/index.html#cdck"
license=('GPL2')
depends=('glibc' 'gcc-libs')
optdepends=('gnuplot')
if [[ $CARCH == 'x86_64' ]]; then
  _debarch=amd64
  md5sums=('304aab6393370cfd4304958846c258a0')
else
  _debarch=i386
  md5sums=('21c8eacaf17f5994e6567225f4e570ea')
fi
source=("${_debrepo}${_debname}/${_debname}_${pkgver}${_debrel}_${_debarch}.deb")

package() {
  cd "$srcdir"
  ar x "${_debname}_${pkgver}${_debrel}_${_debarch}.deb"
  tar xf data.tar.xz -C "$pkgdir/"
}

