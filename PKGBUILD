# Maintainer : David Phillips <dbphillipsnz@gmail.com>
# Contributor: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-bot-basicbot
pkgver=0.89
pkgrel=1
pkgdesc="Simple irc bot baseclass"
depends=('perl>=5.10.0'
         'glibc'
         'perl-poe'
         'perl-poe-component-irc'
         'perl-irc-utils')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Bot-BasicBot"
source=(http://search.cpan.org/CPAN/authors/id/H/HI/HINRIK/Bot-BasicBot-$pkgver.tar.gz)
options=('!emptydirs')
arch=('i686' 'x86_64')
sha256sums=('4c39b018d878db3286946955382625d9c9056a64128d77dbc57e5aaeab2f3948')

build() {
  cd "${srcdir}/Bot-BasicBot-${pkgver}"

  perl Makefile.PL INSTALLDIRS=vendor
  make
}

package() {
  cd "${srcdir}/Bot-BasicBot-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

