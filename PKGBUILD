# Contributor: John D Jones III <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname='perl-anyevent-fastping'
pkgver='2.02'
pkgrel='1'
pkgdesc="quickly ping a large number of hosts"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('glibc>=2.20' 'perl-anyevent' 'perl-common-sense>=3.4')
makedepends=()
url='http://search.mcpan.org/dist/AnyEvent-FastPing'
source=('http://search.mcpan.org/CPAN/authors/id/M/ML/MLEHMANN/AnyEvent-FastPing-2.02.tar.gz')
md5sums=('718f9edbbc08d6d17465a47791a6e0fa')
sha512sums=('b42e84d464279751474c5f62f6dab5f3df8811606922e64ef61c9d98f0c59126871d2dce021fc714941d8e0e9daac1e601686225d59826e74571eb75434cde55')
_distdir="AnyEvent-FastPing-2.02"

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
