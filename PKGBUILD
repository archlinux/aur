# Contributor: Justin Davis <jrcd83 at gmail>
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-class-trigger'
pkgver='0.14'
pkgrel='1'
pkgdesc="Mixin to add / call inheritable triggers"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-io-stringy')
url='http://search.cpan.org/dist/Class-Trigger'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Class-Trigger-0.14.tar.gz')
md5sums=('b0a95ebe359a3c4e768d81fc58031c83')

build() {
  _DISTDIR="${srcdir}/Class-Trigger-0.14"
  export PERL_MM_USE_DEFAULT=1
  { cd "$_DISTDIR" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test &&
    make DESTDIR="${pkgdir}/" install;
  } || return 1;

  find "$pkgdir" -name .packlist -delete
  find "$pkgdir" -name perllocal.pod -delete
}
