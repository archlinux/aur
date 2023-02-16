# Maintainer: Damien Molinier <damien-43\N{COMMERCIAL AT}gmx.fr>
# Contributor: John D Jones III AKA jnbek <jnbek1972 -_AT_- g m a i l -_Dot_- com>
# Generator  : CPANPLUS::Dist::Arch 1.32

_distname='Data-Printer'

pkgname='perl-data-printer'
pkgver='1.001000'
pkgrel='1'
pkgdesc="colored pretty-print of Perl data structures and objects"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl-clone-pp' 'perl-file-homedir>=0.91' 'perl-package-stash>=0.3' 'perl-sort-naturally')
url="https://metacpan.org/release/${_distname}"
source=("http://cpan.metacpan.org/authors/id/G/GA/GARU/${_distname}-${pkgver}.tar.gz")
sha512sums=('bb10b42305d6c3f9672037979c3de55d07633a05c2e630c7649c148fd162c1fcd23eff7e5c7f564af182366181715c413844a0904d91000604360602e752ba5a')

_distdir="${_distname}-${pkgver}"

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
