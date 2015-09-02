# Maintainer Keerthan Jaic <jckeerthan at gmail dot com>
# Contributor Artem Klevtsov <a.a.klevtsov at gmail dot com>

pkgname=pandoc-bin
pkgver=1.15.0.6
pkgrel=1
pkgdesc="Universal markup converter (Binary build from official deb)"
url="http://pandoc.org/"
license=('GPL2')
arch=('x86_64')
depends=('gmp' 'zlib')
optdepends=('texlive-most: for PDF creation')
provides=('pandoc-cabal' 'pandoc-static' 'pandoc-rstudio')
conflicts=('pandoc-cabal' 'pandoc-static' 'pandoc-rstudio')
source_x86_64=("https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-1-amd64.deb")
md5sums_x86_64=('6af83d0fd197e9427f5735b3684b82af')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"
  # This folder only has the license
  rm -r "${pkgdir}"/usr/share/doc
}
