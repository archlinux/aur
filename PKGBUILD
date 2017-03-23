# Maintainer: Stephen Argent <steve [at] tuxcon [dot] com>

pkgname=maltego-community
pkgdesc='Maltego Community Edition'
license=('Commercial')
url='https://www.paterva.com'
pkgver=4.0.11.9358
pkgrel=1
arch=('i686' 'x86_64')
depends=('jre8-openjdk')
source_i686=(
  "${url}/malv4/community/MaltegoCE.v${pkgver}.deb"
)
source_x86_64=(
  "${url}/malv4/community/MaltegoCE.v${pkgver}.deb"
)
sha256sums_i686=(bfd7610647dc09e81abb6df737bcafe319e534b7d1867b1fd8f9bcd3963c25b1)
sha256sums_x86_64=(bfd7610647dc09e81abb6df737bcafe319e534b7d1867b1fd8f9bcd3963c25b1)
md5sums_i686=(2f67cbf41ebddf490177cd65b046a21c)
md5sums_x86_64=(2f67cbf41ebddf490177cd65b046a21c)

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
  deb_package="MaltegoCE.v${pkgver}.deb"
  ar xf "$deb_package"
  tar xf data.tar.gz -C "$pkgdir"
}

