# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.2.12
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('4fd1310c77231817cc689fda30af6a3ecde1dc64b1e5b2815e22574a1b53f220740e11f987551d623c4c9aa55d2ed1e9c0ac4804da4518659a7f1e5e1e5bafe4')
depends=('base-devel' 'bash' 'findutils' 'libarchive' 'git' 'curl' 'rsync')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
