# Maintainer: patrick <patrick at neumannsland dot de>
# Brought to you by: guy voncken
# (PKGBUILD was written after looking at AUR3 and BlackArch Linux repos)
pkgname=guymager
pkgver=0.8.4
pkgrel=1
pkgdesc="A fast and most user friendly forensic imager."
arch=('i686' 'x86_64')
url="http://guymager.sourceforge.net/"
license=('GPL2')
depends=('qt4' 'gksu' 'hdparm' 'smartmontools' 'parted')
options=('!strip')
if [[ "${CARCH}" == "x86_64" ]] ; then
  _ar=amd64
  sha256sums=('b5b06665406ebdf8e25c23bb8671f60ddcb9751da8280ea9273a430611acd169')
else
  _ar=i386
  sha256sums=('a546ef86ae449b04580b57836b86bb01e3f386de2d1079cdb14572f5ecceec35')
fi
source=("https://downloads.sourceforge.net/project/guymager/guymager/guymager-${pkgver%.[0-9]}.x/guymager-beta_${pkgver}-1_${_ar}.deb")

package() {
  cd "${srcdir}"
  rm debian-binary
  rm control.tar.gz
  tar xJf data.tar.xz -C "${pkgdir}"
}
