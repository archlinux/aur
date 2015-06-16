# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-net-amazon'
pkgver='0.62'
pkgrel='1'
pkgdesc="Framework for accessing amazon.com via REST"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.006' 'perl-http-message' 'perl-libwww' 'perl-log-log4perl>=0.3' 'perl-uri' 'perl-xml-simple>=2.08')
makedepends=()
url='http://search.cpan.org/dist/Net-Amazon'
source=('http://search.cpan.org/CPAN/authors/id/B/BO/BOUMENOT/Net-Amazon-0.62.tar.gz')
md5sums=('ee90c82eca0fb06ca5ab9e9b9c2e92b8')
sha512sums=('61e454ca611e0f0de45f7f4661c4b784f6f49cadcfdf5f63fe2cc0d66e7bccf755672bc3848f636cb94eda89f1d18b24ade1cf9a9df89afec76e52a306e7638f')
_distdir="Net-Amazon-0.62"

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
