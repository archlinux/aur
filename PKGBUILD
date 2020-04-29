# Maintainer: Daniel M. Capella <polyzen@archlinux.org>

pkgname=twa
pkgver=1.9.2
pkgrel=1
pkgdesc='Tiny web auditor with strong opinions'
arch=('any')
url=https://github.com/trailofbits/twa
license=('MIT')
depends=('bash' 'bind-tools' 'curl' 'jq' 'netcat')
checkdepends=('shellcheck' 'testssl.sh')
optdepends=('testssl.sh')
source=("$url/archive/v$pkgver/twa-v$pkgver.tar.gz")
sha512sums=('82204e0b3d0524b612b3405e91bc42a44f4b93770f852191094c506b0c0284b4eac28e500844ec3607ab28a19b221262652ba6e37d5f68447a32af490aee4e7c')

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
