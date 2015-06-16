# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.30

pkgname='perl-critic'
pkgver='1.125'
pkgrel='1'
pkgdesc="Critique Perl source code for best-practices."
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-b-keywords>=1.05' 'perl-config-tiny>=2' 'perl-email-address>=1.889' 'perl-exception-class>=1.23' 'perl-file-homedir' 'perl-file-which' 'perl-io-string' 'perl-list-moreutils>=0.19' 'perl-module-pluggable>=3.1' 'perl-ppi>=1.220' 'perl-ppix-regexp>=0.027' 'perl-ppix-utilities' 'perl-tidy' 'perl-pod-spell>=1' 'perl-readonly>=2' 'perl-string-format>=1.13' 'perl-task-weaken')
makedepends=()
checkdepends=('perl-test-deep')
url='https://metacpan.org/release/Perl-Critic'
source=('http://search.cpan.org/CPAN/authors/id/T/TH/THALJEF/Perl-Critic-1.125.tar.gz')
md5sums=('c22b0e945cfbc75fadb0a7b110e00de3')
sha512sums=('f812167d6857bc6da2e8cb6b215aca33e2903e00a4c66aecb8349fcbd1fcb9854de0ee2e5cc000acc67b5023091897e46f59af316cd3c2028a42132a6977a453')
_distdir="Perl-Critic-1.125"

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
