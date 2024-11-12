# Maintainer: Joop KIEFTE <ikojba@gmail.com>

pkgname=etime
pkgver=1
pkgrel=3
pkgdesc="A UTC based universal time system. Explained at etime.neocities.org"
arch=('x86_64' 'i686')
url="http://github.com/LaPingvino/$pkgname/"
license=('MIT')
makedepends=('go')
options=('!strip' '!emptydirs')
source=("http://github.com/LaPingvino/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('78367c8e010f3b23d5479bf28a96426e4d1e94b8f7c30a507b4eaeeac731e17b')

build() {
    cd "$pkgname-$pkgver"
      go mod init github.com/lapingvino/etime
      go mod tidy
	  cd "cmd/etime"
	    go build
    }

package() {
	  cd "$pkgname-$pkgver/cmd/etime"

	    install -Dm755 etime "$pkgdir/usr/bin/$pkgname"

	  cd "../.."
	    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
      }

# vim:set ts=2 sw=2 et:
