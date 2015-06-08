# Maintainer: Albert Chang <albert.chang@gmx.com>

_author=mschilli
_perlmod=XML-RSS-FromHTML-Simple
pkgname=perl-xml-rss-fromhtml-simple
pkgver=0.05
pkgrel=1
pkgdesc="Create RSS feeds for sites that don't offer them"
arch=('i686' 'x86_64')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
depends=('perl-html-parser>=3.56' 'perl-html-tree' 'perl-log-log4perl' 'perl-data-hexdumper' 'perl-xml-rss>=1.22' 'perl-xml-simple>=2.16')
provides=('perl-xml-rss-fromhtml-simple')
options=(!emptydirs)
source=("http://search.cpan.org/CPAN/authors/id/M/MS/MSCHILLI/$_perlmod-$pkgver.tar.gz")
md5sums=('65b771492dd7e3fee01f570854983864')

build() {
  cd "$srcdir/$_perlmod-$pkgver"

  # Install module in vendor directories.
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

  ## For packages with Build.PL, do this instead:
  # perl Build.PL installdirs=vendor destdir="$pkgdir/"
  # perl Build
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  make install DESTDIR="$pkgdir/"

  ## For packages with Build.PL, do this instead:
  # perl Build install
}

# vim:set ts=2 sw=2 et:
