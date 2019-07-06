# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=maltego
pkgdesc='Maltego information gathering software by Paterva'
license=('Commercial')
url='https://www.paterva.com'
pkgver=4.2.4.12374
pkgrel=1
package=Maltego.v${pkgver}.deb
arch=('i686' 'x86_64')
depends=('java-runtime=8')

source_i686=(
  "${url}/malv424/${package}"
)
source_x86_64=(
  "${url}/malv424/${package}"
)
sha256sums_i686=(bf3d2762fd899221720d00b523a31f700d074d73ca13d845bbf212a9c7e00427)
sha256sums_x86_64=(bf3d2762fd899221720d00b523a31f700d074d73ca13d845bbf212a9c7e00427)
md5sums_i686=(0cd85c630bc9a21887c29dffe2d26e42)
md5sums_x86_64=(0cd85c630bc9a21887c29dffe2d26e42)

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

