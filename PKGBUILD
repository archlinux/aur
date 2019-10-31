# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=twa
pkgver=1.9.0
pkgrel=1
pkgdesc='Tiny web auditor with strong opinions'
arch=('any')
url=https://github.com/trailofbits/twa
license=('MIT')
depends=('bash' 'bind-tools' 'curl' 'jq' 'netcat')
checkdepends=('shellcheck')
optdepends=('testssl.sh')
source=("$url/archive/$pkgver/twa-$pkgver.tar.gz")
sha512sums=('0c2c9f62e8d49fd5a457090fcc0f7b888673797fc70c3d2ad3f43a4086efbf9a5acc7c6de4c3345818ca97b5063153ae05e6299d413b408bfb82c3588fb3f88f')

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
