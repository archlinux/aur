# Contributor: Marc Cousin <cousinmarc@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.32

pkgname='perl-object-pluggable'
pkgver='1.29'
pkgrel='1'
pkgdesc="A base class for creating plugin-enabled objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-task-weaken>=0')
makedepends=()
url='https://metacpan.org/release/Object-Pluggable'
source=('http://search.cpan.org/CPAN/authors/id/H/HI/HINRIK/Object-Pluggable-1.29.tar.gz')
md5sums=('25d2c1a2ad5bc129e677738172734a8e')
sha512sums=('2e9a72c47c761312c82b65c9e52f747889f6847feb133f793bbf745f81a47f6a9a633af7ff853bc0e304bcfee130e8b8228d881e0c4d826d6d42eb07ba96cf94')
_distdir="Object-Pluggable-1.29"

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
