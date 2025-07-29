# Maintainer: Guoyi Zhang <myname at malacology dot net>
# Contributor: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=seaview
pkgver=5.1
pkgrel=1
pkgdesc="GUI for multiple sequence alignment and molecular phylogeny. https://doi.org/10.1093/molbev/msp259"
arch=('x86_64')
url="http://doua.prabi.fr/software/seaview"
license=('GPL3')
depends=('fltk')
makedepends=('make' 'gcc' 'fltk')
optdepends=('clustal-omega'
            'muscle'
	    'gblocks'
	    'phyml'
	    'bionj')
source=("https://doua.prabi.fr/software/seaview_data/seaview.tar.gz"
        'seaview.desktop'
        'seaview.png')
md5sums=('57853e73a4e99b15fc1c1b8d50869d76'
         'e4cfc6d76819c5cd8e68ac93c2121557'
         '337583df60b24d724d96e511a3f063ce')
build(){
  cd $pkgname
  make
}

package() {
  install -Dm 755 "$srcdir"/$pkgname/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm 644 seaview.desktop $pkgdir/usr/share/applications/seaview.desktop
  install -Dm 755 "$srcdir"/seaview.png $pkgdir/usr/share/seaview/seaview.png
}
