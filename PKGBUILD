# Maintainer: William J. Bowman <aur@williamjbowman.com>
# Contributor: Justin Davis <jrcd83 at gmail>
# Generator  : CPANPLUS::Dist::Arch 0.14
pkgname='perl-class-trigger'
pkgver='0.14'
pkgrel='2'
pkgdesc="Mixin to add / call inheritable triggers"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl' 'perl-io-stringy')
url='http://search.cpan.org/dist/Class-Trigger'
source=('http://search.cpan.org/CPAN/authors/id/M/MI/MIYAGAWA/Class-Trigger-0.14.tar.gz')
md5sums=('b0a95ebe359a3c4e768d81fc58031c83')
sha256sums=('6b1e45acc561e0708e00a2fcf16e157cad8b8963d1bf73726f77dd809b8aebc4')
sha512sums=('f0908469a4853ef386158f2ee66bb52a1bb4cfcdb385ecd9fd3375af87943910ba75f99066a00eab5dd367f68404369c8ad4ae2afbcb76d18e9f1327f95eb2ca')

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
