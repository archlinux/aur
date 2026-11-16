# Maintainer: Saurabh Kushwah <saurabhkushwahjnv@gmail.com>

# Upstream PKGBUILD repository: https://github.com/Saurabh825/PKGBUILDs

pkgname=cqli-bin
_pkgname=${pkgname%-bin}
pkgver=1.0.8
pkgrel=1
pkgdesc="A chess query facility for PGN databases"
arch=(x86_64)
url="https://cql64.com"
license=('BSD-3-Clause')
depends=("glibc>=2.27")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver.zip::$url/downloads/$_pkgname-$pkgver-linux.zip")
sha256sums=('ec634cf307c76f3df17258c85f4521df7ea3c3e0dce9b8bfc5094c4ba0395f37')

package() {
  cd "$srcdir"
  install -Dm0755 -t "$pkgdir/usr/bin" "$_pkgname"

  # Install documentation
  install -Dm644 manual.pdf "$pkgdir/usr/share/doc/$_pkgname/manual.pdf"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
