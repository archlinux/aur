# Maintainer: Oliver Lantwin <olantwin+aur@gmail.com>
# Contributor: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=lastpass-cli
pkgver=0.5.1
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
md5sums=('dc7e3f9e51b240a162fa5fa179b73c3a')

build() {
  cd $pkgname-$pkgver
  make all doc
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install install-doc
}

# vim:set ts=2 sw=2 et:
