# Author: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname='perl-libwww-dict-leo-org'
pkgver=1.45
pkgrel=1
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
_ddir="WWW-Dict-Leo-Org-${pkgver}"

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
