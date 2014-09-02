# CPAN Name  : Email::FolderType
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.29

pkgname=perl-email-foldertype
pkgver=0.814
pkgrel=2
pkgdesc='Perl module to determine the type of a mail folder'
arch=('any')
url='http://search.cpan.org/dist/Email-FolderType'
license=('PerlArtistic' 'GPL')
depends=('perl>=5.8.9' 'perl-module-pluggable')
checkdepends=('perl>=5.13.4' 'perl-capture-tiny')
source=(http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-FolderType-0.814.tar.gz)
options=(!emptydirs)
md5sums=('952aad6ab391737932dc32c6e5c17d26')

build() {
  cd Email-FolderType-0.814
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd Email-FolderType-0.814
  make test
}

package() {
  cd Email-FolderType-0.814
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
