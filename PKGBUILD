# Maintainer: Joop KIEFTE <ikojba@gmail.com>

pkgname=clitris
pkgver=1
pkgrel=1
pkgdesc="A command line interface block stacker"
arch=('x86_64' 'i686')
url="http://codeberg.org/lapingvino/$pkgname/"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("http://codeberg.org/lapingvino/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('a925372671e9c5fb4bf57c0640f156901aa60831f283759fa0a2e42e6cd99d06')

build() {
	  cd "$pkgname"
      go mod tidy
	    go build
    }

package() {
	  cd "$pkgname"

	    install -Dm755 clitris "$pkgdir/usr/bin/$pkgname"
	    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    }

# vim:set ts=2 sw=2 et:
