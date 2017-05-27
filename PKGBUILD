# Contributor: Ondrej Kucera <ondrej.kucera@centrum.cz>

pkgname=ruby-docs-rdocs
pkgver=2.4.1
pkgrel=1
pkgdesc="Documentation for the Ruby programming language"
arch=('any')
url="http://www.ruby-doc.org/"
license=('BSD' 'custom')
options=('!strip' 'docs' 'libtool' 'staticlibs' '!zipman')
_core_filename='ruby_2_4_1_core_rdocs.tgz'
_stdlib_filename='ruby_2_4_1_stdlib_rdocs.tgz'
source=("http://www.ruby-doc.org/downloads/$_core_filename" "http://www.ruby-doc.org/downloads/$_stdlib_filename")
sha512sums=('2422be5bfdec9e099c200fdd1ef4d84a5fa3344a17b49160df9949727d49df215547c25f77d29ee3895749be401dd3d44519c0811bc053f1476ee57b3ed15016'
            '6e6bac647a6e874ad45afbf3cdee2c6b0224fa1277501c30e852fda9d36ac89ecccd18068c29250f7bbb58cd4dcd4d82ed33392aedd6570738e1b9303005fe48')
noextract=($_core_filename $_stdlib_filename)

package(){
  mkdir -p "$pkgdir/usr/share/doc/ruby"
  cd "$pkgdir/usr/share/doc/ruby"
  tar -xzf "$srcdir/$_core_filename"
  tar -xzf "$srcdir/$_stdlib_filename"
}
