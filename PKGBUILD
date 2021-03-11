# Maintainer : Michael Schubert <mschu.dev at gmail>
# Contributor: yescalona <yescalona[at]ug[dot]uchile[dot]cl>
# Contributor : soeren <nonick[at]posteo[dot]de>
pkgname=blast+-bin
pkgver=2.11.0
pkgrel=1
pkgdesc="New suite of BLAST tools that utilizes the NCBI C++ Toolkit"
arch=('x86_64')
url="https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastHome"
license=('custom')
depends=('perl' 'zlib' 'libidn')
provides=('blast+')
conflicts=('blast+')
source=(https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$pkgver/ncbi-blast-$pkgver+-x64-linux.tar.gz)
sha256sums=('93454cbdf5ba6f541745f31155efd9ba48bc6249fe3659b0aeaea4af62e62b58')

package() {
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/doc/$pkgname

  cd "$srcdir"/ncbi-blast-$pkgver+
  install -Dm755 bin/* "$pkgdir"/usr/bin
  install -Dm644 doc/* "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/blast+-bin/LICENSE
}
