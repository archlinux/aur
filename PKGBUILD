# Maintainer: Eric Engestrom <aur@engestrom.ch>
# Contributor: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>

pkgname=open-dyslexic-fonts
pkgver=0.91.12
pkgrel=1
pkgdesc="Typeface that uses typeface shapes & features to help offset some visual symptoms of Dyslexia"
arch=(any)
url="https://opendyslexic.org"
license=(SIL-OFL)
source=($pkgname-v$pkgver.tar.gz::https://github.com/antijingoist/opendyslexic/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('d20d182fb7069023b8dbdf131bbe232093b4147dd4900e27c95b86d3ddfca34b')

package() {
  cd opendyslexic-$pkgver
  for otf in compiled/*.otf; do
    install -Dm644 $otf "$pkgdir"/usr/share/fonts/OTF/${otf##*/}
  done
  install -Dm644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
