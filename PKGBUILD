# Maintainer: masutu <masutu dot arch at gmail dot com>
_perlmod=Audio-MadJACK
pkgname=perl-audio-madjack
pkgver=0.04
pkgrel=1
pkgdesc="Talk to MadJACK server using Object Oriented Perl."
arch=('any')
url="http://search.cpan.org/~$_author/$_perlmod-$pkgver/"
license=('GPL' 'PerlArtistic')
groups=()
depends=('perl>=5.10.0' 'perl-net-liblo')
options=(!emptydirs)
source=(http://search.cpan.org/CPAN/authors/id/N/NJ/NJH/Audio-MadJACK-0.04.tar.gz)
md5sums=('25b30009b48ed9a9d863e78e50440351')

build() {
  cd "$srcdir/$_perlmod-$pkgver"
  export PERL_MM_USE_DEFAULT=1 PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='$pkgdir'" \
    PERL_MB_OPT="--installdirs vendor --destdir '$pkgdir'" \
    MODULEBUILDRC=/dev/null
  perl Build.PL
  perl Build
  perl Build test
}

package() {
  cd "$srcdir/$_perlmod-$pkgver"
  perl Build install
}

# vim:set ts=2 sw=2 et:
