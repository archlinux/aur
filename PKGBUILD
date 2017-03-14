# Author: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname='perl-html-tableparser'
_realname='HTML-TableParser'
pkgver=0.40
pkgrel=2
pkgdesc="HTML::TableParser - Extract data from an HTML table"
arch=('any')
url="https://metacpan.org/release/HTML-TableParser"
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

build() {
    cd "${_realname}-${pkgver}" || return 1

    # Setting these env variables overwrites any command-line options we don't want...
    export PERL_MM_USE_DEFAULT=1
    export PERL_AUTOINSTALL=--skipdeps
    export PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"
    export PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'"
    export PERL5LIB=""
    export PERL_LOCAL_LIB_ROOT=""
    export MODULEBUILDRC=/dev/null

    /usr/bin/perl Makefile.PL
    make
}

check() {
    cd "${_realname}-${pkgver}" || return 1

    # Setting these env variables overwrites any command-line options we don't want...
    export PERL_MM_USE_DEFAULT=1
    export PERL_AUTOINSTALL=--skipdeps
    export PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"
    export PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'"
    export PERL5LIB=""
    export PERL_LOCAL_LIB_ROOT=""
    export MODULEBUILDRC=/dev/null

    make test
}

package() {
    cd "${_realname}-${pkgver}" || return 1

    # Setting these env variables overwrites any command-line options we don't want...
    export PERL_MM_USE_DEFAULT=1
    export PERL_AUTOINSTALL=--skipdeps
    export PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'"
    export PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'"
    export PERL5LIB=""
    export PERL_LOCAL_LIB_ROOT=""
    export MODULEBUILDRC=/dev/null

    make install

    # remove perllocal.pod and .packlist
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
