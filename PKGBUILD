# Maintainer: Trizen <echo dHJpemVueEBnbWFpbC5jb20K | base64 -d>
# Contributor: Dimitrije Radojevic <templaryum@gmail.com>

pkgname=perl-text-asciitable
pkgver=0.20
pkgrel=1
_distname="Text-ASCIITable-${pkgver}"
pkgdesc="Perl/CPAN Module Text::ASCIITable"
arch=("i686" "x86_64")
url="https://metacpan.org/pod/Text::ASCIITable"
license=("GPL" "Artistic")
source=("http://search.cpan.org/CPAN/authors/id/L/LU/LUNATIC/${_distname}.tar.gz")
sha256sums=('866a1c7dd0150be75e1a4be275858dfc048a165f378ef3845a844526f019a69c')

package() {
  cd $_distname
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make install DESTDIR="$pkgdir" || return 1
}
