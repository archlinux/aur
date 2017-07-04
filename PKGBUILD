# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>
# Contributor: Oliver Lantwin <olantwin+aur@gmail.com>
# Contributor: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=lastpass-cli
pkgver=1.2.1
pkgrel=1
pkgdesc="LastPass command line interface tool"
arch=('i686' 'x86_64')
url="https://lastpass.com/"
license=('GPL2')
depends=('openssl' 'curl' 'libxml2')
makedepends=('asciidoc' 'cmake')
optdepends=('xclip: clipboard support'
            'pinentry: securely read passwords')
source=("https://github.com/lastpass/lastpass-cli/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('1a49a37a67a973296e218306e6d36c9383347b1833e5a878ebc08355b1c77456')

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
