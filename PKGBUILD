# Maintainer : KokaKiwi <kokakiwi+aur at kokakiwi dot net>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Jakob Gahde <j5lx@fmail.co.uk>

pkgname=php-wikidiff2
pkgver=1.13.0
pkgrel=1
pkgdesc="A PHP module that provides the external diff engine for MediaWiki"
arch=('i686' 'x86_64')
license=('GPL')
url='https://www.mediawiki.org/wiki/Extension:Wikidiff2'
depends=('php' 'libthai')
source=("https://releases.wikimedia.org/wikidiff2/wikidiff2-$pkgver.tar.gz"{,.sig})
sha512sums=('0eed27723a8c9f14ddf82a2c990536783c914bb2daa8cfac4fd875839592c7c65376c90a422a3f5eef2e0b8b8bca1cbd658d124d5698342bcc2438d35d1f2ffb'
            'SKIP')
validpgpkeys=('FA1E9F9A41E7F43502CA5D6352FC8E7BEDB7FCA2'
              '83936EF3764977485D3A50344354894545DA0139')

build() {
  cd "$srcdir/wikidiff2-$pkgver"

  phpize
  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir/wikidiff2-$pkgver"

  make install INSTALL_ROOT="$pkgdir"
}
