# Contributor: Anton Leontiev <bunder /at/ t-25.ru>
pkgname=perl-email-folder
pkgver=0.855
pkgrel=1
pkgdesc="Perl module to read all messages from a folder as Email::Simple objects"
arch=("any")
url="http://search.cpan.org/dist/Email-Folder/"
license=("GPL" "PerlArtistic")
depends=("perl" "perl-email-foldertype>=0.6" "perl-email-simple")
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Email-Folder-$pkgver.tar.gz)
md5sums=("0058c0c066bb383103976f659fa8b301")

build() {
  cd "$srcdir/Email-Folder-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd "$srcdir/Email-Folder-$pkgver"
  make test
}

package() {
  cd "$srcdir/Email-Folder-$pkgver"
  make install DESTDIR="$pkgdir"
  find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
