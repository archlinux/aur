# Maintainer: Oliver Lantwin <olantwin+aur@gmail.com>
# Contributor: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=lastpass-cli
pkgver=0.7.1
pkgrel=1
pkgdesc="LastPass command line interface tool"
arch=('i686' 'x86_64')
url="https://lastpass.com/"
license=('GPL2')
depends=('openssl' 'curl' 'libxml2')
makedepends=('asciidoc')
optdepends=('xclip: clipboard support'
	   'pinentry: securely read passwords')
source=("https://github.com/lastpass/lastpass-cli/archive/v${pkgver}.tar.gz")
md5sums=('3de417e4e9712e7356bf8c6fc7dfd7ff')

build() {
  cd $pkgname-$pkgver
  make all doc
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install install-doc
}

# vim:set ts=2 sw=2 et:
