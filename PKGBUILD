# Maintainer : Michael Schubert <mschu.dev at gmail>
# Contributor: yescalona <yescalona[at]ug[dot]uchile[dot]cl>
# Contributor : soeren <nonick[at]posteo[dot]de>

pkgname='blast+-bin'
pkgver=2.2.30
pkgrel=1
pkgdesc="New suite of BLAST tools that utilizes the NCBI C++ Toolkit"
arch=('i686' 'x86_64')
url="http://blast.ncbi.nlm.nih.gov/Blast.cgi?CMD=Web&PAGE_TYPE=BlastHome"
license=('custom')
depends=('perl' 'zlib')
PKGEXT='.pkg.tar'

_arch=$CARCH
[[ $CARCH == i686 ]] && _arch="ia32"
[[ $CARCH == x86_64 ]] && _arch="x64"
source=("ftp://ftp.ncbi.nlm.nih.gov/blast/executables/blast+/$pkgver/ncbi-blast-$pkgver+-$_arch-linux.tar.gz")
[[ $CARCH == i686 ]] && md5sums=('658b6643f1e7b46f91642cf841e8462a')
[[ $CARCH == x86_64 ]] && md5sums=('e767297c9b007d1ca8e3e385246941dd')

package() {
    cd "$srcdir/ncbi-blast-$pkgver+"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/doc/$pkgname"
    install -Dm755 bin/* "$pkgdir/usr/bin"
    install -Dm644 doc/* "$pkgdir/usr/share/doc/$pkgname"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/blast+-bin/LICENSE"
}
