# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=seaview
pkgver=5.0.4
pkgrel=2
pkgdesc="GUI for multiple sequence alignment and molecular phylogeny"
arch=('x86_64')
url="http://doua.prabi.fr/software/seaview"
license=('GPL3')
depends=('shared-mime-info' 'fltk')
optdepends=('clustal-omega: alignment'
            'muscle: alignment'
	    'gblocks-bin: select blocks of evolutionarily conserved sites')
source=("http://doua.prabi.fr/software/seaview_data/seaview5-64.tgz"
        'seaview.desktop')
md5sums=('c22422d4da24da45a0aa8a3c35e941bf'
         '0a7629bd71cda352c7314546c53d2839')

package() {
  install -d "$pkgdir"/usr/{bin,share/{seaview,applications}}
  install -m644 seaview.desktop "$pkgdir/usr/share/applications/"
  mv "$srcdir"/seaview/* "$pkgdir"/usr/share/seaview
  ln -s "$pkgdir"/usr/share/seaview/seaview "$pkgdir"/usr/bin/seaview
}
