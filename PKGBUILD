# Contributor: gilles DOT quenot AT gmail DOT com
# Generator  : CPANPLUS::Dist::Arch 0.18
pkgname='perl-pod-constants'
pkgver='0.17'
pkgrel='1'
pkgdesc="Include constants from POD"
arch=('i686' 'x86_64')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('perl')
url='http://search.cpan.org/dist/Pod-Constants'
source=("http://search.cpan.org/CPAN/authors/id/S/SA/SAMV/Pod-Constants-${pkgver}.tar.gz")
md5sums=('9b3b9a377ef2f7e70d404155fa38059e')
_dist_dir="Pod-Constants-${pkgver}"
build() {
  export PERL_MM_USE_DEFAULT=1
  { cd "$_dist_dir" &&
    perl Makefile.PL INSTALLDIRS=vendor &&
    make &&
    make test
  } || return 1;

}

package() {
    cd "$_dist_dir"
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
    make DESTDIR="$pkgdir" install;
}
