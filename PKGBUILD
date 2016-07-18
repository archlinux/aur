# Author: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname='perl-html-tableparser'
pkgver=0.40
pkgrel=1
pkgdesc="HTML::TableParser - Extract data from an HTML table"
arch=('any')
url=""
license=('GPL3')
groups=()
depends=('perl-html-parser')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://search.cpan.org/CPAN/authors/id/D/DJ/DJERIUS/HTML-TableParser-${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')
sha256sums=('34e5782ef23c0d9c10c63ad3cc79f5e2769f6e169caf38792a0ed5457437ebbb')
_ddir="HTML-TableParser-${pkgver}"

build() {
    cd "$srcdir/$_ddir"
    export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps
    unset PERL5LIB PERL_MM_OPT
    /usr/bin/perl Makefile.PL
    make
}

check() {
    cd "$srcdir/$_ddir"
    export PERL_MM_USE_DEFAULT=1
    unset PERL5LIB
    make test
}

package() {
    cd "$srcdir/$_ddir"
    make install INSTALLDIRS=vendor DESTDIR="$pkgdir"
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
