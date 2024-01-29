# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.2.17
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('bf6cbe20b813b757664442b86aea7ac14121d6ccebd04a41bf13d43f1cf2f897324c2b77651099b65b798a6a92a4792a0c3c0bce1b28523785eeb002edad1d21')
depends=('base-devel' 'bash' 'findutils' 'libarchive' 'git' 'curl' 'rsync')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
