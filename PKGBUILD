# Maintainer: Oliver Lantwin <olantwin+aur@gmail.com>
# Contributor: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=lastpass-cli
pkgver=1.2.0
pkgrel=0
pkgdesc="LastPass command line interface tool"
arch=('i686' 'x86_64')
url="https://lastpass.com/"
license=('GPL2')
depends=('openssl' 'curl' 'libxml2')
makedepends=('asciidoc' 'cmake')
optdepends=('xclip: clipboard support'
	   'pinentry: securely read passwords')
source=("https://github.com/lastpass/lastpass-cli/archive/v${pkgver}.tar.gz")
md5sums=('cc00024c6360af5c9e3cac09ac93f6bb')

build() {
  cd $pkgname-$pkgver
  cmake . -DCMAKE_INSTALL_PREFIX="/usr" && make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR=${pkgdir} install install-doc
}

# vim:set ts=2 sw=2 et:
