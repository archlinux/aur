# Contributor: Spyros Stathopoulos <foucault.online@gmail.com>
# Using Xyne::Arch::CPAN 0.07

pkgname=perl-time-clock
_cpanname=Time-Clock
pkgver=1.03
pkgrel=1
pkgdesc="Twenty-four hour clock object with nanosecond precision."
arch=('i686' 'x86_64')
url="http://search.cpan.org/dist/Time-Clock/"
license=('perl')
source=(http://search.cpan.org/CPAN/authors/id/J/JS/JSIRACUSA/Time-Clock-${pkgver}.tar.gz)
md5sums=('e287f85f0ca0b4e1ef202849cec911fe')
sha256sums=('35e8a8bbfcdb35d86dd4852a9cd32cfb455a9b42e22669186e920c8aca017aef')
depends=('perl>=5.6.0')
makedepends=('perl-extutils-makemaker')
options=(!emptydirs)

build() {

  cd ${srcdir}/${_cpanname}-${pkgver}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make

}

package() {
  cd ${srcdir}/${_cpanname}-${pkgver}
  make install DESTDIR="${pkgdir}"

  # remove perllocal.pod and .packlist
  find ${pkgdir} -name perllocal.pod -delete
  find ${pkgdir} -name .packlist -delete
}

# vim:ts=2:sw=2:et
