# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-web-simple'
pkgver='0.031'
pkgrel='1'
pkgdesc="A quick and easy way to build simple web applications"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-data-dumper-concise>=2.020' 'perl-moo>=0.009014' 'perl-plack>=0.9968' 'perl-syntax-keyword-gather>=1.001' 'perl>=5.006' 'perl-strictures>=1' 'perl-warnings-illegalproto')
makedepends=()
url='https://metacpan.org/release/Web-Simple'
source=('http://search.cpan.org/CPAN/authors/id/M/MS/MSTROUT/Web-Simple-0.031.tar.gz')
md5sums=('33768f6481fc08e8740c7a9f439a39af')
sha512sums=('41bec4a8ef6a80ed65ac12a42504988c9546a180a8e74815c52066382989a2ce9cf3da2a593a83f63c783756f505a228247aabfc4b6e500c830d56ba01dd634f')
_distdir="Web-Simple-0.031"

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
