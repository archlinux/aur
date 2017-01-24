# Maintainer: Michael Schubert <mschu.dev at gmail>
# Contributor: yescalona <yescalona[at]ug[dot]uchile[dot]cl>
# Contributor: soeren <nonick[at]posteo[dot]de>
# Contributor: Christian Krause ("wookietreiber") <christian.krause@mailbox.org>

pkgname='blast+-bin'
pkgver=2.6.0
pkgrel=1
pkgdesc="New suite of BLAST tools that utilizes the NCBI C++ Toolkit"
arch=('x86_64')
url="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastHome"
license=('custom')
depends=('perl' 'zlib')
provides=('blast+')
conflicts=('blast+')
source=("ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$pkgver/ncbi-blast-$pkgver+-x64-linux.tar.gz")
md5sums=('681b6ecf8d1d08b63f5f940fb53bd6e8')

package() {
  install -d "$pkgdir"/usr/bin
  install -d "$pkgdir"/usr/share/doc/$pkgname

  cd "$srcdir"/ncbi-blast-$pkgver+
  install -Dm755 bin/* "$pkgdir"/usr/bin
  install -Dm644 doc/* "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/blast+-bin/LICENSE
}
