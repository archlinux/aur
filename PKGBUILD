# Maintainer: patrick <patrick at neumannsland dot de>
# Brought to you by: guy voncken
# (PKGBUILD was written after looking at AUR3 and BlackArch Linux repos)
pkgname=guymager
pkgver=0.8.8
pkgrel=1
pkgdesc="A fast and most user friendly forensic imager."
arch=('i686' 'x86_64')
url="http://guymager.sourceforge.net/"
license=('GPL2')
depends=('qt4' 'gksu' 'hdparm' 'smartmontools' 'parted')
options=('!strip')
if [[ "${CARCH}" == "x86_64" ]] ; then
  _ar=amd64
  sha256sums=('679efffe75c807e086fa508b8f5e47b3c19c5298201224a4997bf18d3b12554e')
else
  _ar=i386
  sha256sums=('31180bb9df59ec336ea635d9fce98a68d3b585d7a206d526da262b993a963a63')
fi
source=("https://downloads.sourceforge.net/project/guymager/guymager/guymager-${pkgver%.[0-9]}.x/guymager-beta_${pkgver}-1_${_ar}.deb")

package() {
  cd "${srcdir}"
  rm debian-binary
  rm control.tar.gz
  tar xJf data.tar.xz -C "${pkgdir}"
}
