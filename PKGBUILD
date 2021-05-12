# Maintainer: malacology
# Contributor: malacology

pkgname=phylosuite
pkgver=1.2.2
pkgrel=1
pkgdesc="an integrated and scalable desktop platform for streamlined molecular sequence data management and evolutionary phylogenetics studies"
arch=('any')
url="https://github.com/dongzhang0725/PhyloSuite"
license=('APL3')
depends=('python36' 'python-biopython' 'python-dateutil' 'python-psutil' 'python-pyqt5' 'python-reportlab' 'python-suds')
source=("https://github.com/dongzhang0725/PhyloSuite/archive/refs/tags/${pkgver}.zip" "PhyloSuite.png" "PhyloSuite.desktop")
md5sums=('4092120ff4ad732facd96e3904356e6e'
         'aca08e388f8d6a180a570b31ccebe764'
         '523bcd2d9dfc8a73b23edc9501ec310f')

package() {
  install -dm755 "$pkgdir"/usr/share/{icons,applications}
  cd "$srcdir/PhyloSuite-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -D -m 755 ${srcdir}/*.png "${pkgdir}/usr/share/icons"
  install -D -m 755 ${srcdir}/*.desktop "${pkgdir}/usr/share/applications"
}


