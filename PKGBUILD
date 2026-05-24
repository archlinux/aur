# Maintainer: stag-enterprises < x [at] stag [dot] lol >

pkgname=eyebreak
_hash=9d6df8784a5c11354036b0e81d684f43bd55d46b
pkgver=r4.${_hash::8}
pkgrel=3
pkgdesc="A scheduled timer to protect your eyes"
arch=(any)
url=https://gitgud.io/uwu/eww/eyebreak
license=(MIT)
depends=(quickshell sh qt6-declarative)
makedepends=(git)
source=(git::git+https://gitgud.io/uwu/eww/eyebreak#commit=$_hash)
sha256sums=('b28fae1e9efd1fc868dd20573255c5bab722298e7ecbcaad3933a7a82b40185e')

package() {
     cd "$srcdir/git"
     install -Dm755 eyebreak         "$pkgdir/usr/bin/eyebreak"
     install -Dm644 eyebreak.service "$pkgdir/usr/lib/systemd/user/eyebreak.service"
     install -Dm644 LICENSE          "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
     install -Dm644 README.md        "$pkgdir/usr/share/doc/$pkgname/README.md"

     pushd src
     find . -type d -exec install -dm755 "$pkgdir/usr/share/$pkgname/{}" \;
     find . -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/$pkgname/{}" \;
     popd
}
