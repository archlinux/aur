# Maintainer: Sergey Konoplev <gray.ru@gmail.com>
# Maintainer: Maxim Polishchuck <mpolishchuck@gmail.com>

_perlmod='App-FatPacker'
pkgname=perl-app-fatpacker
pkgver=0.010004
pkgrel=1
pkgdesc="App::FatPacker - pack your dependencies onto your script file."
url="http://search.cpan.org/perldoc?App::FatPacker"
arch=('x86_64' 'i686')
license=('GPLv2')
depends=('perl')
optdepends=()
makedepends=()
conflicts=()
replaces=()
backup=()
source=("http://search.cpan.org/CPAN/authors/id/H/HA/HAARG/${_perlmod}-${pkgver}.tar.gz")
md5sums=('892debf2862f09729fba46a5285958d8')

build() {
  cd "${srcdir}/${_perlmod}-${pkgver}"
  perl Makefile.PL
  make
}

package() {
  cd "${srcdir}/${_perlmod}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et: