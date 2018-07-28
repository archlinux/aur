# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=maltego
pkgdesc='Maltego information gathering software by Paterva'
license=('Commercial')
url='https://www.paterva.com'
pkgver=4.1.12.11480
pkgrel=1
package=maltego_${pkgver}.deb
arch=('i686' 'x86_64')
depends=('java-runtime=8')
source_i686=(
  "${url}/malv41/${package}"
)
source_x86_64=(
  "${url}/malv41/${package}"
)
sha256sums_i686=(a9ed45b79648af6fbf2672ce46a0acd645987a65c34a9ad64ffd443b7d46899c)
sha256sums_x86_64=(a9ed45b79648af6fbf2672ce46a0acd645987a65c34a9ad64ffd443b7d46899c)
md5sums_i686=(5a2b0626dee727359e7b83939dc7b27e)
md5sums_x86_64=(5a2b0626dee727359e7b83939dc7b27e)

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
}

