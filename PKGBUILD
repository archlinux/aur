# Author: Tobias Rueetschi <tr+archlinux at brief dot li>

pkgname='perl-libwww-dict-leo-org'
pkgver=1.40
pkgrel=1
pkgdesc="leo - commandline interface to http://dict.leo.org/."
arch=('any')
url="http://search.cpan.org/~tlinden/WWW-Dict-Leo-Org-1.40/Org.pm"
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
source=("http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/WWW-Dict-Leo-Org-${pkgver}.tar.gz")
noextract=()
md5sums=('SKIP')
sha256sums=('4285702fd5d3e0633891739cb149b9f950afe4c69ad0a10a9c6e185ff29552da')
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
