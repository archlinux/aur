# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=twa
pkgver=1.10.0
pkgrel=1
pkgdesc='Tiny web auditor with strong opinions'
arch=('any')
url=https://github.com/trailofbits/twa
license=('MIT')
depends=('bash' 'bind-tools' 'curl' 'jq' 'netcat')
checkdepends=('shellcheck' 'testssl.sh')
optdepends=('testssl.sh')
source=("$url/archive/v$pkgver/twa-v$pkgver.tar.gz")
sha512sums=('e4ef063941451e296d883527daf8fa41a2f710bf7552e73c9cd731631dbfd7f0b8d95e36f62280990a9bcce6f68d0e64eb170eeb6f8eb16643d6733a3c992a84')

check() {
  cd twa-$pkgver
  ./util/test
}

package() {
  cd twa-$pkgver
  install -Dt "$pkgdir"/usr/bin tscore twa
  install -Dm644 -t "$pkgdir"/usr/share/man/man1 twa.1
  install -Dm644 -t "$pkgdir"/usr/share/licenses/twa LICENSE
}

# vim:set ts=2 sw=2 et:
