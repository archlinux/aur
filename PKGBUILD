# Maintainer: Jonghyo Lee <na1307@outlook.kr>
pkgname=dotup-bin
pkgver=0.0
pkgrel=1
pkgdesc="A .NET version manager"
arch=('x86_64')
url="https://github.com/na1307/dotup"
license=('MIT')
depends=('glibc' 'gcc-libs' 'zlib' 'openssl' 'krb5' 'libunwind')
makedepends=()
provides=('dotup')
conflicts=('dotup')
source_x86_64=("https://github.com/na1307/dotup/releases/download/v${pkgver}/dotup_v${pkgver}_linux-x64.tar.gz")
sha256sums_x86_64=('d9a9e2172f8d940339abdf38bde7173b1e3785042f3115ce16c8421abdcc54fa')

package() {
  # Install binary
  install -Dm755 "$srcdir/dotup" "$pkgdir/usr/bin/dotup"

  # Install profile script
  install -Dm755 "$srcdir/dotup.sh" "$pkgdir/etc/profile.d/dotup.sh"

  # Install License
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
