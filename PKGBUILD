# Maintainer: Jakob Nixdorf <flocke [swirly thing] shadowice [dot] org>

pkgname=perl-bot-basicbot
pkgver=0.89
pkgrel=1
pkgdesc="simple irc bot baseclass"
depends=('perl>=5.10.0' 'glibc' 'perl-poe' 'perl-poe-component-irc' 'perl-irc-utils')
license=('GPL' 'PerlArtistic')
url="http://search.cpan.org/dist/Bot-BasicBot"
source=(http://search.cpan.org/CPAN/authors/id/H/HI/HINRIK/Bot-BasicBot-$pkgver.tar.gz)
options=('!emptydirs')
arch=(i686 x86_64)

build()
{
  cd ${srcdir}/Bot-BasicBot-$pkgver

  perl Makefile.PL INSTALLDIRS=vendor || return 1
  make || return 1
  make DESTDIR=${pkgdir} install || return 1

  # Remove .packlist and perllocal.pod files.
  find ${pkgdir} -name '.packlist' -delete
  find ${pkgdir} -name 'perllocal.pod' -delete

}

md5sums=('34bc132338ce3fad601050a7815dbe41')
