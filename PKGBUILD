# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-critic'
pkgver='1.126'
pkgrel='2'
pkgdesc="Critique Perl source code for best-practices."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-module-build' 'perl-b-keywords>=1.05' 'perl-config-tiny' 'perl-email-address>=1.889' 'perl-exception-class>=1.23' 'perl-file-homedir' 'perl-file-which' 'perl-io-string' 'perl-list-moreutils>=0.19' 'perl-module-pluggable>=3.1' 'perl-ppi>=1.220' 'perl-ppix-regexp>=0.027' 'perl-ppix-utilities' 'perl-tidy' 'perl-pod-spell' 'perl-readonly' 'perl-string-format>=1.13' 'perl-task-weaken')
makedepends=()
checkdepends=('perl-test-deep')
url='https://metacpan.org/release/Perl-Critic'
source=('http://search.cpan.org/CPAN/authors/id/T/TH/THALJEF/Perl-Critic-1.126.tar.gz')
md5sums=('c5c698baa7fd373ea893ff39f29ed7b9')
_distdir="Perl-Critic-1.126"

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
