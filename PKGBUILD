# Maintainer: Thomas Mashos <thomas at mashos dot com>
pkgname=fantasygroundsinstaller
pkgver=1.0.1
pkgrel=1
pkgdesc="Web installer for Fantasy Grounds Unity"
arch=('x86_64')
url="https://www.fantasygrounds.com"
license=('Proprietary')
groups=()
depends=()
options=(!strip)
source=("FGUWebInstall.deb::https://www.fantasygrounds.com/filelibrary/FGUWebInstall.deb")
sha256sums=('cc33fe09c3005bd78e69d3eae73c833b756789fae8787cdeb78e91543c773337')

prepare() {
  tar -xf ${srcdir}/data.tar.xz
  sed -i "s/usr\/share/opt/" "${srcdir}/bin/FantasyGrounds"
  sed -i "s/usr\/share/opt/" "usr/share/applications/FantasyGrounds.desktop"
}

package() {
  mkdir -p "${pkgdir}/usr/bin"
  mv "bin/FantasyGrounds" "${pkgdir}/usr/bin/"

  mkdir -p "${pkgdir}/opt"
  mv "usr/share/smiteworks" "${pkgdir}/opt/"
}

