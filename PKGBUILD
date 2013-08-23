# CPAN Name  : Template::Declare
# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
# Generator  : CPANPLUS::Dist::Arch 1.23

pkgname=perl-template-declare
pkgver=0.46
pkgrel=1
pkgdesc="Pure-Perl declarative HTML/XUL/RDF/XML templating system"
arch=("any")
url="http://search.cpan.org/dist/Template-Declare"
license=("PerlArtistic" "GPL")
depends=("perl>=5.8.2" "perl-class-accessor" "perl-class-data-inheritable" "perl-class-isa" "perl-html-lint" "perl-string-bufferstack>=1.1")
checkdepends=("perl-test-warn>=0.11")
source=(http://search.cpan.org/CPAN/authors/id/A/AL/ALEXMV/Template-Declare-0.46.tar.gz)
options=(!emptydirs)
md5sums=("3ac9c89cb6000ca7284ad57ed77bba5a")

build() {
  cd "$srcdir/Template-Declare-0.46"
  PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL="--skipdeps" perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Template-Declare-0.46"
  make test
}

package() {
  cd "$srcdir/Template-Declare-0.46"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
