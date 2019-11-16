# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=ruby-docs-rdocs
pkgver=2.6.5
pkgrel=1
pkgdesc="Documentation for the Ruby programming language"
arch=('any')
url="http://www.ruby-doc.org/"
license=('BSD' 'custom')
options=('!strip' 'docs' 'libtool' 'staticlibs' '!zipman')
_core_filename='ruby_2_6_5_core_rdocs.tgz'
_stdlib_filename='ruby_2_6_5_stdlib_rdocs.tgz'
source=("http://www.ruby-doc.org/downloads/$_core_filename" "http://www.ruby-doc.org/downloads/$_stdlib_filename")
sha512sums=('4cd09e7aa560d19955af54b3bce2e2d0491994698b3a1df2997d8c0f39e55fa015788189450b432c9679ae34261bbee21ed68cbad45f492142e80960240d7d6a'
            '09850cb11f74ceb4885baba6599ca8d9ee4ea86c75ac6aa501f3b7d54e9b70519cb345602da2e329f0746d825e4e682d8d72f0707c819e2b484a348d61084525')
noextract=($_core_filename $_stdlib_filename)

package(){
  mkdir -p "$pkgdir/usr/share/doc/ruby"
  cd "$pkgdir/usr/share/doc/ruby"
  tar -xzf "$srcdir/$_core_filename"
  tar -xzf "$srcdir/$_stdlib_filename"
}
