# Maintainer: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=python2-htseq
pkgver=0.7.2
pkgrel=1
pkgdesc='framework to process and analyze data from high-throughput sequencing assays'
arch=('i686' 'x86_64')
url="http://www-huber.embl.de/users/anders/HTSeq/doc/overview.html"
license=('GPL')
depends=('python2-matplotlib')
source=("https://pypi.python.org/packages/46/f7/6105848893b1d280692eac4f4f3c08ed7f424cec636aeda66b50bbcf217e/HTSeq-$pkgver.tar.gz")
md5sums=('8ddaaf53e83547fbca3bba7b84c9dde8')
options=('!emptydirs')

prepare() {
  cd $srcdir/HTSeq-$pkgver

  sed -e 's|env python|env python2|' \
      -i python2/HTSeq/scripts/qa.py
}

package() {
  cd $srcdir/HTSeq-$pkgver

  python2 setup.py install --root=$pkgdir --optimize=1
}
