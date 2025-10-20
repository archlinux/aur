# Maintainer:
# Contributor: arkhan <arkhan@disroot.org>

_pkgname="eless"
pkgname="$_pkgname"
pkgver=0.7
pkgrel=2
pkgdesc="A bash script that loads emacs with minimal view-mode config"
url="https://github.com/kaushalmodi/eless"
license=('MIT')
arch=('any')

depends=(bash emacs)
makedepends=(git)

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git#tag=v$pkgver")
sha256sums=('36e2b2ea243f50973eb0d9b9af7e901f361f3d194a7463b8d0e2ff7f2b508b63')

build() {
  cd "$_pkgsrc"
  make eless
}

package() {
  cd "$_pkgsrc"
  install -Dm755 eless -t "$pkgdir/usr/bin/"

  mkdir -pm755 "$pkgdir/usr/share/doc/$_pkgname"
  cp -rf docs "$pkgdir/usr/share/doc/$_pkgname"

  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
