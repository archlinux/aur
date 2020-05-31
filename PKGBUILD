# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=twa
pkgver=1.9.3
pkgrel=1
pkgdesc='Tiny web auditor with strong opinions'
arch=('any')
url=https://github.com/trailofbits/twa
license=('MIT')
depends=('bash' 'bind-tools' 'curl' 'jq' 'netcat')
checkdepends=('shellcheck' 'testssl.sh')
optdepends=('testssl.sh')
source=("$url/archive/v$pkgver/twa-v$pkgver.tar.gz")
sha512sums=('96a6d6288a0c1cd5caa9c4bb83ac167abde4d1963cbb0e4a426d558d2b20f95e6c3d944dac719baa048d96c0817a056844910e14a99a00eb70c04528eb77d811')

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
