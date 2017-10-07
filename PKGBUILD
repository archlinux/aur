# Maintainer : int <int [ate] arcor [dot] de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-template-plugin-htmltotext'
pkgver='0.03'
pkgrel='1'
pkgdesc="Perl/CPAN Module Template::Plugin::HtmlToText: Plugin interface to HTML::FormatText"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
makedepends=('perl-html-formatter' 'perl-html-tree' 'perl-template-toolkit')
url='https://metacpan.org/release/Template-Plugin-HtmlToText'
source=('http://search.cpan.org/CPAN/authors/id/F/FA/FAYLAND/Template-Plugin-HtmlToText-0.03.tar.gz')
md5sums=('d5400a942b2b5be3d8c5d003782430db')
sha512sums=('3b2cf8fdc470dc3389cbba4ce03230d0d59e1e01853a54da1b655cb7c740613618537d4afdb29c9f3d717aea09bd5ad635c310830d4adcd54aaa3a5a6623b1c3')
_distdir="Template-Plugin-HtmlToText-0.03"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
  )
}

package() {
  cd "$srcdir/$_distdir"
  make install
  find "$pkgdir" "(" -name .packlist -o -name perllocal.pod ")" -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
