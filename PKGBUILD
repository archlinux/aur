# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=maltego-community
pkgdesc='Maltego Community Edition'
license=('Commercial')
url='https://www.paterva.com'
pkgver=4.1.6.11045
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
sha256sums_i686=(45c67827ba0871b7ddf4d224b6e3b4ca23e455472b385ee00affc5045d3ea818)
sha256sums_x86_64=(45c67827ba0871b7ddf4d224b6e3b4ca23e455472b385ee00affc5045d3ea818)
md5sums_i686=(90af01333d812e002a2bcee1ce00026d)
md5sums_x86_64=(90af01333d812e002a2bcee1ce00026d)

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

