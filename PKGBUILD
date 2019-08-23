# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=maltego
pkgdesc='Maltego information gathering software by Paterva'
license=('Commercial')
url='https://www.paterva.com'
pkgver=4.2.6.12502
pkgrel=1
package=Maltego.v${pkgver}.deb
arch=('i686' 'x86_64')
depends=('java-runtime=8')

source_i686=(
  "${url}/malv426/${package}"
)
source_x86_64=(
  "${url}/malv426/${package}"
)
sha256sums_i686=(cd127ad57deb603ec181ae367b194d0e312dc1be912d933a24398c6ac9832947)
sha256sums_x86_64=(cd127ad57deb603ec181ae367b194d0e312dc1be912d933a24398c6ac9832947)
md5sums_i686=(7400f0e8fba47b7fdf8bc2b4a9d23714)
md5sums_x86_64=(7400f0e8fba47b7fdf8bc2b4a9d23714)

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

