# Maintainer:
# Contributor: adrusi <adrian at adrusi dot com>

pkgname=terra-bin
pkgver=1.1.0
pkgrel=1
pkgdesc='Low-level system programming language designed to interoperate seamlessly with Lua'
arch=('x86_64')
url='https://github.com/terralang/terra'
license=('MIT')

options=(!strip !debug)

provides=(terra)
conflicts=(terra)

_commit='be89521'
source=(
  "$url/releases/download/release-$pkgver/terra-Linux-$CARCH-$_commit.tar.xz"
)
sha256sums=(
  'ee2b13715704da41b0d475b44e1e0432f4395edff44b535353652bda8f6610b1'
)

package() {
  cd "$srcdir/terra-Linux-$CARCH-$_commit"

  mkdir -p "$pkgdir"/usr/{lib,include/terra}
  install -Dm644 include/terra/* "$pkgdir/usr/include/terra"
  install -Dm644 lib/* "$pkgdir/usr/lib"
  install -Dm644 share/terra/LICENSE.txt -t "$pkgdir/usr/share/licenses/$pkgname"
  install -Dm755 bin/terra "$pkgdir/usr/bin/terra"
}

