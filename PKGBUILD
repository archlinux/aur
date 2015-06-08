# Maintainer: FadeMind <fademind@gmail.com>
# CPAN Name  : Gtk2-Ex-Simple-List
# Contributor: Justin Davis <jrcd83@gmail.com>
# Generator  : CPANPLUS::Dist::Arch 1.07
pkgname='perl-gtk2-ex-simple-list'
pkgver='0.50'
pkgrel='2'
pkgdesc="A simple interface to Gtk2's complex MVC list widget"
arch=('any')
license=('PerlArtistic' 'GPL')
options=('!emptydirs')
depends=('gtk2-perl' 'glib-perl')
makedepends=()
url='http://search.cpan.org/dist/Gtk2-Ex-Simple-List'
source=('http://search.cpan.org/CPAN/authors/id/R/RM/RMCFARLA/Gtk2-Perl-Ex/Gtk2-Ex-Simple-List-0.50.tar.gz')
md5sums=('f66c71bbb794b699f0c3e8ca7cebc35b')

_distdir="Gtk2-Ex-Simple-List-0.50"

build() {
    export PERL_MM_USE_DEFAULT=1 PERL5LIB="" \
        PERL_AUTOINSTALL=--skipdeps \
        PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
        PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
        MODULEBUILDRC=/dev/null

    cd "$srcdir/$_distdir"
    /usr/bin/perl Makefile.PL
    make
}

check() {
    cd "$srcdir/$_distdir"
    export PERL_MM_USE_DEFAULT=1 PERL5LIB=""
    make test
}

package() {
    cd "$srcdir/$_distdir"
    make install
    find "$pkgdir" -name .packlist -o -name perllocal.pod -delete
}
