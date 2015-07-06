# Maintainer: masutu <masutu dot arch at googlemail dot com>
# Contributor: masutu <masutu dot arch at googlemail dot com>
pkgname=perl-net-opensoundcontrol
pkgver=0.05
pkgrel=1
pkgdesc="OpenSound Control client and server implementation in Perl"
arch=('any')
url="http://search.cpan.org/~crenz/Net-OpenSoundControl-0.05/"
license=('GPL' 'PerlArtistic')
depends=('perl>=5.10.0')
options=(!emptydirs)
source=('http://search.cpan.org/CPAN/authors/id/C/CR/CRENZ/Net-OpenSoundControl-0.05.tar.gz')
md5sums=('0451efc9feee4d1a3dc04ea043a47af7')

build() {
  cd "$srcdir/Net-OpenSoundControl-$pkgver"
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir/" || return 1
  for _file in "makebundle.pl" "oscclient.pl" "oscserver.pl" "reaktor2.pl" "reaktor.pl"
    do install -Dm 644 examples/$_file $pkgdir/usr/share/$pkgname/examples/$_file
  done
}

# vim:set ts=2 sw=2 et:
