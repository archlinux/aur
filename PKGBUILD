# Maintainer: Mintsuki <mintsuki@protonmail.com>
pkgname=jinx
pkgver=0.2.27.1
pkgrel=1
pkgdesc="A meta-build-system for building OS distributions"
arch=("any")
url="https://github.com/mintsuki/jinx"
license=("BSD")
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/mintsuki/jinx/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('58f341f14f33868aa603d26c15c815e0b99a9d8dedd33704bb637f1b7fa37fc360dd85438debb3b2efc839889f95764452dc61c6387f2cbcbf1cc08fc27b8432')
depends=('gcc' 'sh' 'findutils' 'libarchive' 'git' 'curl' 'zstd' 'rsync')

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}" PREFIX=/usr
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
