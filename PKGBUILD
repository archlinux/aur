# Maintainer : ReneganRonin <renegan.ronin@gmail.com>
pkgname=blast+-latest-bin
pkgver=2.11.0
pkgrel=1
pkgdesc="New suite of BLAST tools that utilizes the NCBI C++ Toolkit"
arch=('x86_64')
url="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastHome"
license=('custom')
depends=('perl' 'zlib' 'libidn')
provides=('blast+')
conflicts=('blast+')
source=("ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/LATEST/ncbi-blast-$pkgver+-x64-linux.tar.gz")
sha256sums=('SKIP')

package() {
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/doc/$pkgname

  cd "$srcdir"/ncbi-blast-$pkgver+
  install -Dm755 bin/* "$pkgdir"/usr/bin
  install -Dm644 doc/* "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/blast+-bin/LICENSE
}
