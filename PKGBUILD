# Maintainer: Danny Waser <danny@waser.tech>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Thore Bödecker <foxxx0@archlinux.org>
# Contributor: Matmas <matmas@matmas.net>
# Contributor: Thomas Gubler <thomasgubler@gmail.com>
# Contributor: Daniel YC Lin <dlin.tw at gmail>
# Contributor: Florian Bruhin <archlinux.org@the-compiler.org>

pkgname=python38-websocket-client
pkgver=1.4.2
pkgrel=1
pkgdesc="WebSocket client library for Python"
arch=('any')
url="https://github.com/websocket-client/websocket-client"
license=('LGPL')
depends=('python38')
makedepends=('python38-setuptools')
checkdepends=('python38-pytest')
source=("https://pypi.io/packages/source/w/websocket-client/websocket-client-$pkgver.tar.gz")
sha512sums=('4003a6b387096a738e9b9f76129b954bbc208b8b75c6ba9d6f0dade82078645109f985164ce25c1a600e630833f7187d51d6236997d6c72315d206e91f1aae7a')

build() {
  cd websocket-client-$pkgver
  python3.8 setup.py build
}

check() {
  cd websocket-client-$pkgver
  pytest
}

package() {
  cd websocket-client-$pkgver
  python3.8 setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 ft=sh et:
