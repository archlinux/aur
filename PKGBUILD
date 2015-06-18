# Contributor: gilles DOT quenot AT gmail DOT com
# Generator  : CPANPLUS::Dist::Arch 0.18
pkgname='perl-lingua-translate'
pkgver='0.09'
pkgrel='3'
pkgdesc="Translate text from one language to another"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-html-parser>=2.19' 'perl-libwww>=1.73' 'perl-pod-constants>=0.15' 'perl-unicode-maputf8>=1.09' 'perl-unicode-maputf8' 'perl-pod-constants')
url='http://search.cpan.org/dist/Lingua-Translate'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SAMV/Lingua-Translate-0.09.tar.gz')
md5sums=('82571abf6f5872bb2f106f71185a6aa9')

build() {
  DIST_DIR="${srcdir}/Lingua-Translate-0.09"
  export PERL_MM_USE_DEFAULT=1
  { cd "$DIST_DIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test
  } || return 1

}

package() {
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
    make DESTDIR="$pkgdir" install
}
