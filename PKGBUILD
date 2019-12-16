# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=maltego
pkgdesc='Maltego information gathering software by Paterva'
license=('Commercial')
url='https://www.paterva.com'
pkgver=4.2.8.12786
pkgrel=1
package=Maltego.v${pkgver}.deb
arch=('i686' 'x86_64')
depends=('java-runtime=8')

source_i686=(
  "${url}/malv428/${package}"
)
source_x86_64=(
  "${url}/malv428/${package}"
)
sha256sums_i686=(c35db822ffb88c7807b9ea694821a3af3ca4f872ad44908dba695c53293a0c21)
sha256sums_x86_64=(c35db822ffb88c7807b9ea694821a3af3ca4f872ad44908dba695c53293a0c21)
md5sums_i686=(7682d118f2b2123815215b6f4ea40164)
md5sums_x86_64=(7682d118f2b2123815215b6f4ea40164)

install=maltego.install

package() {
  if [ "$CARCH" = "i686" ] ; then
    deb_arch="i386"
  elif [ "$CARCH" = "x86_64" ] ; then
    deb_arch="amd64"
  else
    echo "Unknown arch: $CARCH"
    exit 1
  fi

  cd "$srcdir"
  #deb_package="MaltegoCE.v${pkgver}.deb"
  ar xf "$package"
  tar xf data.tar.gz -C "$pkgdir"
  # Packagaers left DS_Store files, so we have to remove
  rm -rf "$pkgdir"/{,usr/{,share/{,maltego/}}}.DS_Store
  #rm -rf $pkgdir/.DS_Store
}

