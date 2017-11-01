# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=maltego-community
pkgdesc='Maltego Community Edition'
license=('Commercial')
url='https://www.paterva.com'
pkgver=4.1.0.10552
pkgrel=1
package=maltego_v${pkgver}.deb
arch=('i686' 'x86_64')
depends=('java-runtime=8')
source_i686=(
  "${url}/malv41/${package}"
)
source_x86_64=(
  "${url}/malv41/${package}"
)
sha256sums_i686=(62c04216a7eb96895555c622565cdbafd17db3ba569712378be4ddabf695f63e)
sha256sums_x86_64=(62c04216a7eb96895555c622565cdbafd17db3ba569712378be4ddabf695f63e)
md5sums_i686=(2dc25c68ba830a975beaa12af9dbd232)
md5sums_x86_64=(2dc25c68ba830a975beaa12af9dbd232)

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

