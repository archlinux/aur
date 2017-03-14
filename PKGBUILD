# Author: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname='perl-libwww-dict-leo-org'
_realname='WWW-Dict-Leo-Org'
pkgver=1.45
pkgrel=2
pkgdesc="leo - commandline interface to http://dict.leo.org/."
arch=('any')
url="https://metacpan.org/pod/WWW::Dict::Leo::Org"
license=()
groups=()
depends=('perl-html-tableparser')
makedepends=('perl')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://cpan.metacpan.org/authors/id/T/TL/TLINDEN/WWW-Dict-Leo-Org-${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')
sha256sums=('8cfb10412175bc5638cd4daf17b71c66cc98a52acca857f495d5b8aa50258829')

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
