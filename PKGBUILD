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
source=("ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$pkgver/ncbi-blast-$pkgver+-x64-linux.tar.gz")
noextract=("ncbi-blast-$pkgver+-x64-linux.tar.gz")
md5sum=("3c7338de3ec14eaa1c50842f28e3a1de")

prepare() {
  tar zxvpf ncbi-blast-$pkgver+-x64-linux.tar.gz 
}

package() {
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/doc/$pkgname

  cd "$srcdir"/ncbi-blast-$pkgver+
  install -Dm755 bin/* "$pkgdir"/usr/bin
  install -Dm644 doc/* "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/blast+-bin/LICENSE
}
