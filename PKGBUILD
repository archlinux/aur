# Maintainer: patrick <patrick at neumannsland dot de>
# Brought to you by: guy voncken
# (PKGBUILD was written after looking at AUR3 and BlackArch Linux repos)
pkgname=guymager
pkgver=0.8.11
pkgrel=1
pkgdesc="A fast and most user friendly forensic imager."
arch=('i686' 'x86_64')
url="http://guymager.sourceforge.net/"
license=('GPL2')
depends=('qt5-base' 'polkit' 'hdparm' 'smartmontools' 'parted')
options=('!strip')
if [[ "${CARCH}" == "x86_64" ]] ; then
  _ar=amd64
  sha256sums=('63fca98a24d6cf86d2b5f8e9f88e51a2a0d80602b654741deee14de141eb35c6')
else
  _ar=i386
  sha256sums=('e83d5b8bcbe553f282f3c64a82d1f3b8eddf98e1c68c2117bb415d12773c0f2a')
fi
source=("https://downloads.sourceforge.net/project/guymager/guymager/guymager-${pkgver%.[0-9][0-9]}.x/guymager-beta_${pkgver}-1_${_ar}.deb")

package() {
  cd "${srcdir}"
  rm debian-binary
  rm control.tar.gz
  tar xJf data.tar.xz -C "${pkgdir}"
}
