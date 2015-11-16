# Maintainer Keerthan Jaic <jckeerthan at gmail dot com>
# Contributor Artem Klevtsov <a.a.klevtsov at gmail dot com>

pkgname=pandoc-bin
pkgver=1.15.2
pkgrel=1
pkgdesc="Universal markup converter (Binary build from official deb)"
url="http://pandoc.org/"
license=('GPL2')
arch=('x86_64')
depends=('gmp' 'zlib')
optdepends=('texlive-most: for PDF creation')
provides=('pandoc' 'haskell-pandoc-citeproc' 'pandoc-cabal' 'pandoc-static' 'pandoc-rstudio')
conflicts=('pandoc' 'haskell-pandoc-citeproc' 'pandoc-cabal' 'pandoc-static' 'pandoc-rstudio')
source_x86_64=("https://github.com/jgm/pandoc/releases/download/${pkgver}/pandoc-${pkgver}-1-amd64.deb")
md5sums_x86_64=('2ae31e78304ad08849a4b48cb95b8d72')

package() {
  bsdtar -xf data.tar.gz -C "${pkgdir}/"
  # This folder only has the license
  rm -r "${pkgdir}"/usr/share/doc
}
