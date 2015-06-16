# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-dist-zilla-plugin-signature'
pkgver='1.100930'
pkgrel='1'
pkgdesc="sign releases with Module::Signature"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-dist-zilla>=2.100921' 'perl-file-chdir' 'perl-module-signature')
makedepends=()
url='http://search.cpan.org/dist/Dist-Zilla-Plugin-Signature'
source=('http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/Dist-Zilla-Plugin-Signature-1.100930.tar.gz')
md5sums=('c443e2906036e45836576c964b610dc1')
sha512sums=('b5e247842a17922700c1250601afbe60f60d9f7da617af39d26ef1dce004ae44913c42ef2019c22f49e437d0df99ceff6ecb2de1a461f4f3b84247f49ba4028a')
_distdir="Dist-Zilla-Plugin-Signature-1.100930"

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

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
