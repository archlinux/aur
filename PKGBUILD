# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.2.11
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('a467eeb75f0505ade017341e790e727d9730a9842ce50e9a65cf588aed7b53e2e31a4bff216f92b0cb758ebabaa10c2190fd57712db9848266e1ba70572eb13e')
depends=('base-devel' 'bash' 'findutils' 'libarchive' 'git' 'curl' 'rsync')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
