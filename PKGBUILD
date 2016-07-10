# Maintainer: Len Zhang <zyldragoon@gmail.com>

pkgname=noto-fonts-cjk-otf
pkgver=1.004
pkgrel=1
pkgdesc="Google Noto CJK fonts, use OTF type to solve some font fallback problems"
arch=(any)
url="https://www.google.com/get/noto/"
license=(custom:SIL)
depends=(fontconfig)
conflicts=('noto-fonts-cjk')
provides=("noto-fonts-cjk=$pkgver")
install=$pkgname.install
source=("https://github.com/googlei18n/noto-cjk/archive/v$pkgver.tar.gz")
sha256sums=('835a42755c1e8d6a4a406f32609da1f0fa7f9674d05760f0be658d9d6f4ab71c')

package() {
  mkdir -p "$pkgdir"/usr/share/fonts/OTF/noto-cjk
  install -m644 noto-cjk-$pkgver/*.otf "$pkgdir"/usr/share/fonts/OTF/noto-cjk
  install -Dm644 noto-cjk-$pkgver/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
