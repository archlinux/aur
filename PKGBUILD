# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.27

pkgname='perl-lwpx-paranoidagent'
pkgver='1.10'
pkgrel='1'
pkgdesc="subclass of LWP::UserAgent that protects you from harm"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-crypt-ssleay>=0' 'perl-net-dns>=0' 'perl-libwww>=0')
makedepends=()
url='http://search.cpan.org/dist/LWPx-ParanoidAgent'
source=('http://search.cpan.org/CPAN/authors/id/S/SA/SAXJAZMAN/lwp/LWPx-ParanoidAgent-1.10.tar.gz')
md5sums=('7a6e764acf3b58d71c149ed877c9cb8a')
sha512sums=('8a1a1cdc4ab826b66abedfbbe7baee694d1083fc6dce2c2f6b69bf5e369ef0212ffdcd2afc9fadafa9977e3be9f7a4e4b1ea092e6c6773c1f9fc356c87c5434d')
_distdir="LWPx-ParanoidAgent-1.10"

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
