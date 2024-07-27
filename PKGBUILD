# Maintainer:
# Contributor: adrusi <adrian at adrusi dot com>

_pkgname="terra"
pkgname="$_pkgname-bin"
pkgver=1.2.0
pkgrel=1
pkgdesc='Low-level system programming language designed to interoperate seamlessly with Lua'
url='https://github.com/terralang/terra'
license=('MIT')
arch=('x86_64')

provides=("terra=$pkgver")
conflicts=("terra")

options=('!strip' '!debug')

_commit='cc543dbcc85dbda84d5aec624d80f76642566940'

_pkgsrc="terra-Linux-$CARCH-${_commit::7}"
_pkgext="tar.xz"
source=(
  "$_pkgname-$pkgver-${_commit::7}.$_pkgext"::"$url/releases/download/release-$pkgver/terra-Linux-$CARCH-${_commit::7}.$_pkgext"
)
sha256sums=(
  '32f6420330de4d7176396aa36929a76733fe5a1fbc5a0cf8b9a6d270f9630d8d'
)

package() {
  cd "$_pkgsrc"
  install -Dm644 include/terra/* -t "$pkgdir/usr/include/terra/"
  install -Dm644 lib/* -t "$pkgdir/usr/lib/"
  install -Dm644 share/terra/LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 bin/terra "$pkgdir/usr/bin/terra"
}
