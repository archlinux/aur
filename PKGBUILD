# Maintainer: patrick <patrick at neumannsland dot de>
# Brought to you by: guy voncken
# (PKGBUILD was written after looking at AUR3 and BlackArch Linux repos)
pkgname=guymager
pkgver=0.8.3
pkgrel=1
pkgdesc="A fast and most user friendly forensic imager."
arch=('i686' 'x86_64')
url="http://guymager.sourceforge.net/"
license=('GPL2')
depends=('qt4' 'gksu' 'hdparm' 'smartmontools' 'parted')
options=('!strip')
if [[ "${CARCH}" == "x86_64" ]] ; then
  _ar=amd64
  sha256sums=('725189d1cedcf54ae20200c459403130038018204445f921e6802093efb15866')
else
  _ar=i386
  sha256sums=('3d1cc20506067efb6525b13883a7472a28860c605559d4e989d9bdac31b2e17d')
fi
source=("http://sourceforge.net/projects/guymager/files/guymager/guymager-${pkgver%.[0-9]}.x/guymager-beta_${pkgver}-1_${_ar}.deb/download")

package() {
  cd "${srcdir}"
  rm debian-binary
  rm control.tar.gz
  tar xJf data.tar.xz -C "${pkgdir}"
}
