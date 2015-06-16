# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-ipc-run3-simple'
pkgver='0.011'
pkgrel='1'
pkgdesc="Simple utility module to make the easy to use IPC::Run3 even more easy to use."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl>=5.004' 'perl-capture-tiny' 'perl-ipc-run3')
makedepends=('perl-test-checkdeps' 'perl-test-most' 'perl-test-nowarnings' 'perl-test-requires' 'perl-test-useallmodules')
url='http://search.cpan.org/dist/IPC-Run3-Simple'
source=('http://search.cpan.org/CPAN/authors/id/A/AY/AYOUNG/IPC-Run3-Simple-0.011.tar.gz')
md5sums=('aa4f5fbe05905d5908fd8b0d44f09565')
sha512sums=('8244f3db9f1d23ef571657b4fb7484c6767a476e7574a34f70c2e002b2a8dfa235cf8f27cecf367d2ad84844157199cb7e80b713700df2d2a706c0aee7cdd2fd')
_distdir="IPC-Run3-Simple-0.011"

build() {
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                 \
      PERL_AUTOINSTALL=--skipdeps                            \
      PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
      PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
      MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Build.PL
    /usr/bin/perl Build
  )
}

check() {
  cd "$srcdir/$_distdir"
  ( export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    /usr/bin/perl Build test
  )
}

package() {
  cd "$srcdir/$_distdir"
  /usr/bin/perl Build install

  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
