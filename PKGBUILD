# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.2.16
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('940e4b532d75ecaade88d6575f40f808c2a0e4f298d0e39b927edad74a5a51bb15fe9e35937bcd09f0e4b73e341aac26ccf9bc04e06fe411025547e690277d71')
depends=('base-devel' 'bash' 'findutils' 'libarchive' 'git' 'curl' 'rsync')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
