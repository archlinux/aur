# Maintainer: Saurabh Kushwah <saurabhkushwahjnv@gmail.com>

# Upstream PKGBUILD repository: https://github.com/Saurabh825/PKGBUILDs

pkgname=cqli-bin
_pkgname=${pkgname%-bin}
pkgver=1.0.7
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
sha256sums=('03937bf2c2672f8ba52b86d7867de09756f3b2bd94feb175ea3409d762c9b67f')

package() {
  cd "$srcdir"
  install -Dm0755 -t "$pkgdir/usr/bin" "$_pkgname"

  # Install documentation
  install -Dm644 manual.pdf "$pkgdir/usr/share/doc/$_pkgname/manual.pdf"

  # Install license
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
