# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: Nick B <Shirakawasuna at gmail _dot_com>

pkgname=seaview
pkgver=5.0.4
pkgrel=2
pkgdesc="GUI for multiple sequence alignment and molecular phylogeny"
arch=('x86_64')
url="http://doua.prabi.fr/software/seaview"
license=('GPL3')
optdepends=('clustal-omega'
      'muscle'
	    'gblocks-bin'
	    'phyml')
source=("http://doua.prabi.fr/software/seaview_data/seaview5-64.tgz"
        'seaview.desktop'
        'seaview.png')
md5sums=('c22422d4da24da45a0aa8a3c35e941bf'
         '43fa9e52949a5cd73f202af76e2cab56'
         '337583df60b24d724d96e511a3f063ce')

package() {
  install -d "$pkgdir"/usr/{bin,share/{seaview,applications}}
  install -m644 seaview.desktop "$pkgdir/usr/share/applications/"
  mv "$srcdir"/seaview/* "$pkgdir"/usr/share/seaview
  ln -s /usr/share/seaview/seaview "$pkgdir"/usr/bin/seaview
  install -Dm 755 "$srcdir"/seaview.png "$pkgdir"/usr/share/seaview/seaview.png
}
