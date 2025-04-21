# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: yescalona <yescalona[at]ug[dot]uchile[dot]cl>
# Contributor: soeren <nonick[at]posteo[dot]de>
pkgname=blast+-bin
pkgver=2.16.0
pkgrel=1
pkgdesc="New suite of BLAST tools that utilizes the NCBI C++ Toolkit"
arch=('x86_64')
url="https://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastHome"
license=('custom')
depends=('perl' 'zlib' 'libidn')
provides=('blast+')
conflicts=('blast+')
source=(https://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$pkgver/ncbi-blast-$pkgver+-x64-linux.tar.gz)
sha256sums=('b0b13098c901d23b324ad1700e7471bb7408a7f7f517d74d5faad711be76e8f4')

package() {
  install -d "$pkgdir"/usr/{bin,share/doc/$pkgname}

  cd "$srcdir"/ncbi-blast-$pkgver+
  install -m755 bin/* "$pkgdir"/usr/bin
  install -m644 doc/* "$pkgdir"/usr/share/doc/$pkgname
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/blast+-bin/LICENSE
}
