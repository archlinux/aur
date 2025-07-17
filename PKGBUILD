# Contributor: Ordoban <dirk.langer@vvovgonik.de>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-moose'
pkgver='2.4000'
pkgrel='2'
pkgdesc="A postmodern object system for Perl 5"
arch=('x86_64' 'aarch64')
license=('Artistic-1.0')
options=('!emptydirs')
depends=('perl-cpan-meta-check>=0.011' 'perl-class-load>=0.09' 'perl-class-load-xs>=0.01' 'perl-data-optlist>=0.107' 'perl-devel-globaldestruction>=0' 'perl-devel-overloadinfo>=0.005' 'perl-devel-stacktrace>=2.03' 'perl-dist-checkconflicts>=0.02' 'perl-eval-closure>=0.04' 'perl-mro-compat>=0.05' 'perl-module-runtime>=0.014' 'perl-module-runtime-conflicts>=0.002' 'perl-package-deprecationmanager>=0.11' 'perl-package-stash>=0.32' 'perl-package-stash-xs>=0.24' 'perl-params-util>=1.00' 'perl-sub-exporter>=0.980' 'perl-try-tiny>=0.17')
makedepends=()
checkdepends=('perl-test-fatal>=0.001' 'perl-test-needs>=0.002010')
url='https://metacpan.org/release/Moose'
source=("http://search.cpan.org/CPAN/authors/id/E/ET/ETHER/Moose-$pkgver.tar.gz")
md5sums=('3623f7f05aac55e70daa208a42e67228')
sha512sums=('facae305a538ce55cad1aa1b420a5a2ba7a6f2de502257fe84094ce1d2f91c8f297318e404c1bc236ce6ef2800bac9bb782191061925505c970fb6e38ff1ab87')
_distdir="Moose-$pkgver"

build() {
  export PERL_MM_USE_DEFAULT=1 PERL5LIB=""                      \
         PERL_AUTOINSTALL=--skipdeps                            \
         PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"     \
         PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
         MODULEBUILDRC=/dev/null

  cd "$srcdir/$_distdir"
  /usr/bin/perl Makefile.PL
  make
}

check() {
  cd "$srcdir/$_distdir"
  export PERL_MM_USE_DEFAULT=1 PERL5LIB="."
  make test
}

package() {
  cd "$srcdir/$_distdir"
  make install

  find "$pkgdir" \( -name .packlist -o -name perllocal.pod \) -delete
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# End:
# vim:set ts=2 sw=2 et:
