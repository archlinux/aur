# Contributor: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname=python2-htseq
pkgver=0.11.0
pkgrel=1
pkgdesc='framework to process and analyze data from high-throughput sequencing assays'
arch=('i686' 'x86_64')
url="https://pypi.org/project/HTSeq/"
license=('GPL')
depends=('python2-matplotlib')
source=("https://pypi.python.org/packages/c9/e7/598b33395ac7c9417a7d7cfcb2d04cbfc2e410199cc7f938eed287bb5eae/HTSeq-$pkgver.tar.gz")
# https://files.pythonhosted.org/packages/c9/e7/598b33395ac7c9417a7d7cfcb2d04cbfc2e410199cc7f938eed287bb5eae/HTSeq-0.11.0.tar.gz
md5sums=('ddfd1fb725594fab37fcc2d4b00bb028')
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
