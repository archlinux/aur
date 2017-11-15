# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Oliver Lantwin <olantwin+aur@gmail.com>
# Contributor: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=lastpass-cli
pkgver=1.2.2
pkgrel=1
pkgdesc="LastPass command line interface tool"
arch=('x86_64')
url="https://lastpass.com/"
license=('GPL2')
depends=('openssl' 'curl' 'libxml2')
makedepends=('asciidoc' 'cmake')
optdepends=('xclip: clipboard support'
            'pinentry: securely read passwords')
source=("https://github.com/lastpass/lastpass-cli/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('26c93ae610932139dacaff2e0f916c5628def48bb4129b4099101cf4e6c7c499')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX="/usr"
	make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  make DESTDIR="$pkgdir" install install-doc
}

# vim:set ts=2 sw=2 et:
