# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=seaview
pkgver=4.5.4
pkgrel=1
pkgdesc="GUI for multiple sequence alignment and molecular phylogeny"
arch=('i686' 'x86_64')
url="http://doua.prabi.fr/software/seaview"
license=('GPL3')
depends=('shared-mime-info' 'fltk')
optdepends=('clustal-omega: alignment'
            'muscle: alignment')
install='seaview.install'
source=("ftp://pbil.univ-lyon1.fr/pub/mol_phylogeny/$pkgname/archive/${pkgname}_${pkgver}.tar.gz"
        'seaview.desktop'
        'seaview.sharedmimeinfo')
md5sums=('9c7797be6349bd5ad5dfa30297d3bd71'
         '94f13509470dd69f053ffc178884e292'
         '9592a71ee55fa6edfbaddbce2d5469b9')

build() {
  cd seaview
  make
}

package() {
  install -d $pkgdir/usr/{bin,share/{seaview,pixmaps,man/man1,applications,icons/hicolor/scalable/apps,mime/packages,doc/seaview}}

  install -m644 seaview.desktop $pkgdir/usr/share/applications/
  install -m644 seaview.sharedmimeinfo $pkgdir/usr/share/mime/packages/seaview.xml

  cd seaview
  install -m755 seaview $pkgdir/usr/bin/
  install -m644 seaview.xpm $pkgdir/usr/share/pixmaps/
  install -m644 seaview.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/
  install -m644 seaview.html $pkgdir/usr/share/doc/seaview/
  install -m644 seaview.1 $pkgdir/usr/share/man/man1/
}
