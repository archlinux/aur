# Maintainer: patrick <patrick at neumannsland dot de>
# Brought to you by: guy voncken
# (PKGBUILD was written after looking at AUR3 and BlackArch Linux repos)

pkgname=guymager
pkgver=0.8.13
pkgrel=1
pkgdesc="A fast and most user friendly forensic imager."
arch=('i686' 'x86_64')
url="http://guymager.sourceforge.net/"
license=('GPL2')
depends=('qt5-base' 'polkit' 'hdparm' 'smartmontools' 'parted')
options=('!strip')
if [[ "${CARCH}" == "x86_64" ]] ; then
  _ar=amd64
  sha256sums=("b7834e93f36b7dc8416df6b2bda56e7c1c38fdbef513929df14246786a7b3f92")
else
  _ar=i386
  sha256sums=("5a2bb64969b2d7ee365814e860549f240891e2fcb05dfca060be95c58dfd1230")
fi
source=("https://downloads.sourceforge.net/project/guymager/guymager/guymager-${pkgver%.[0-9][0-9]}.x/guymager-beta_${pkgver}-1_${_ar}.deb")

package() {
  cd "${srcdir}"
  rm debian-binary
  rm control.tar.xz
  tar xJf data.tar.xz -C "${pkgdir}"
}
