# Maintainer : Luis Aranguren <pizzaman@hotmail.com>
# Contributor: John D Jones III <j[nospace]n[nospace]b[nospace]e[nospace]k[nospace]1972 -_AT_- the domain name google offers a mail service at ending in dot com>
# Generator  : CPANPLUS::Dist::Arch 1.25

pkgname='perl-class-mix'
pkgver='0.006'
pkgrel='1'
pkgdesc="dynamic class mixing"
_dist='Class-Mix'
arch=('any')
url='http://search.cpan.org/dist/Class-Mix'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.006' 'perl-params-classify' 'perl-module-build')
options=('!emptydirs' purge)
source=("http://search.cpan.org/CPAN/authors/id/Z/ZE/ZEFRAM/$_dist-$pkgver.tar.gz")
sha512sums=('f1e52d189a57b4a6e4b7b093cd561881bcccec03dcf7286d69b592865343ab413ab35e42c14dd92ceb0089df1df33df4ff2a502026fde060ef246e77c8d21af1')

build() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 MODULEBUILDRC=/dev/null
  /usr/bin/perl Build.PL
  ./Build
}

check() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  ./Build test
}

package() {
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_MB_OPT PERL_LOCAL_LIB_ROOT
  ./Build install --installdirs=vendor --destdir="$pkgdir"
}
