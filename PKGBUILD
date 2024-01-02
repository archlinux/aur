# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.2.13
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('93ef2876373224ae5e02c4fe5637984244f97bdfa4f2e3c457afc1fe6f6ffba3c555bffb84315ab4f47dfbbdc4cf00a89f8a867862e1a6e996bc5a04309d4ca1')
depends=('base-devel' 'bash' 'findutils' 'libarchive' 'git' 'curl' 'rsync')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
