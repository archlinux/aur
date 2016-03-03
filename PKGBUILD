# Maintainer: Oliver Lantwin <olantwin+aur@gmail.com>
# Contributor: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=lastpass-cli
pkgver=0.9.0
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
md5sums=('fe994ef7a3d1619c9436dfea17e59f02')

build() {
  cd $pkgname-$pkgver
  make all doc
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir/" install install-doc
  install -Dm 644 contrib/lpass_bash_completion "$pkgdir/usr/share/bash-completion/completions/lpass"
}

# vim:set ts=2 sw=2 et:
