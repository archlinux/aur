# Maintainer: imjiaoyuan <imjiaoyuan@gmail.com>

pkgname=magicblast
pkgver=1.7.2
pkgrel=1
pkgdesc="NCBI MagicBLAST: maps next-generation RNA/DNA reads to a genome or transcriptome"
arch=('x86_64')
url="https://ncbi.github.io/magicblast/"
license=('Public Domain')
depends=('zlib' 'bzip2' 'xz' 'icu' 'libxml2')
optdepends=('blast+: makeblastdb for building search databases')
options=('!strip' '!debug')
source=("https://ftp.ncbi.nlm.nih.gov/blast/executables/magicblast/${pkgver}/ncbi-magicblast-${pkgver}-x64-linux.tar.gz")
sha256sums=('93301d1816fd87fe64bb48950be82e5bf02a45bea81d63fff78c11e9908f4604')
_dir="ncbi-magicblast-${pkgver}"

package() {
    cd "$srcdir/$_dir"
    # magicblast only. makeblastdb is skipped to avoid colliding with blast+.
    install -Dm755 bin/magicblast "$pkgdir/usr/bin/magicblast"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
