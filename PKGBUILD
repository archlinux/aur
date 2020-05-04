# Maintainer: patrick <patrick at neumannsland dot de>
# Brought to you by: guy voncken
# (PKGBUILD was written after looking at AUR3 and BlackArch Linux repos)
pkgname=guymager
pkgver=0.8.12
pkgrel=1
pkgdesc="A fast and most user friendly forensic imager."
arch=('i686' 'x86_64')
url="http://guymager.sourceforge.net/"
license=('GPL2')
depends=('qt5-base' 'polkit' 'hdparm' 'smartmontools' 'parted')
options=('!strip')
if [[ "${CARCH}" == "x86_64" ]] ; then
  _ar=amd64
  sha1sums=('9944c58e0b6ff5c60f6c8523c73fc27e9a0556cb')
else
  _ar=i386
  sha1sums=('acb85ec4ca1ad14571188c74bfe84f9e8df3b43b')
fi
source=("https://downloads.sourceforge.net/project/guymager/guymager/guymager-${pkgver%.[0-9][0-9]}.x/guymager-beta_${pkgver}-1_${_ar}.deb")

package() {
  cd "${srcdir}"
  rm debian-binary
  rm control.tar.gz
  tar xJf data.tar.xz -C "${pkgdir}"
}
