# Contributor: Rick Rein <jeebusroxors@gmail.com>

pkgname=perl-text-aspell
pkgver=0.09
pkgrel=1
pkgdesc="Perl interface to the GNU Aspell library"
url="http://search.cpan.org/~hank/Text-Aspell/"
license="GPL"
arch=('i686' 'x86_64')
options=('!emptydirs')
depends=('perl' 'aspell')
checkdepends=('aspell-en')
source=("http://search.cpan.org/CPAN/authors/id/H/HA/HANK/Text-Aspell-${pkgver}.tar.gz")
md5sums=('67ec8b9c4769969fa714fc25c9c73832')

build() {
    cd "$srcdir/Text-Aspell-$pkgver"
    /usr/bin/perl Makefile.PL
    make
}

check() {
    cd "$srcdir/Text-Aspell-$pkgver"
    make test
}

package() {
    cd "$srcdir/Text-Aspell-$pkgver"
    make DESTDIR="$pkgdir" install

    /usr/bin/find "$pkgdir" -name '.packlist' -exec rm '{}' \;
    /usr/bin/find "$pkgdir" -name 'perllocal.pod' -exec rm '{}' \;
}
