# Maintainer: Kars Wang <jaklsy AT gmail.com>

pkgname='perl-perl-tidy'
pkgver=20140711
pkgrel=1
pkgdesc='indent and reformat perl scripts'
_dist='Perl-Tidy'
arch=('any')
url="https://metacpan.org/release/$_dist"
license=('PerlArtistic')
depends=('perl' )
checkdepends=()
makedepends=('perl-extutils-makemaker>=0')
provides=('perl-perl-tidy-ioscalar=20140711' 'perl-perl-tidy-ioscalararray=20140711' 'perl-perl-tidy-linesource=20140711' 'perl-perl-tidy-linesink=20140711' 'perl-perl-tidy-diagnostics=20140711' 'perl-perl-tidy-logger=20140711' 'perl-perl-tidy-devnull=20140711' 'perl-perl-tidy-htmlwriter=20140711' 'perl-perl-tidy-formatter=20140711' 'perl-perl-tidy-indentationitem=20140711' 'perl-perl-tidy-verticalaligner-line=20140711' 'perl-perl-tidy-verticalaligner-alignment=20140711' 'perl-perl-tidy-verticalaligner=20140711' 'perl-perl-tidy-filewriter=20140711' 'perl-perl-tidy-debugger=20140711' 'perl-perl-tidy-linebuffer=20140711' 'perl-perl-tidy-tokenizer=20140711')
options=('!emptydirs' 'purge')
source=("http://search.cpan.org/CPAN/authors/id/S/SH/SHANCOCK/$_dist-$pkgver.tar.gz")
sha256sums=('1576ceb3fd9f592d0285affbe7192685963dc1d0411968cc0587d6ac0d7b3ad8')

build() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
  /usr/bin/perl Makefile.PL
  make
)

check() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  export PERL_MM_USE_DEFAULT=1
  make test
)

package() (
  cd "$srcdir/$_dist-$pkgver"
  unset PERL5LIB PERL_MM_OPT PERL_LOCAL_LIB_ROOT
  make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
)
