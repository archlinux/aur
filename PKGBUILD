# Maintainer: izzqz <v@izzqz.me>
# Contributor: Eric Engestrom <aur@engestrom.ch>
# Contributor: Chad "crossroads1112" Sharp <crossroads1112@riseup.net>

pkgname=open-dyslexic-fonts
pkgver=0.91.12
pkgrel=2
pkgdesc="Typeface that uses typeface shapes & features to help offset some visual symptoms of Dyslexia"
arch=(any)
replaces=('ttf-opendyslexic' 'otf-opendyslexic-git')
url="https://forge.hackers.town/antijingoist/opendyslexic"
license=('OFL-1.1-RFN')
source=($pkgname-v$pkgver.tar.gz::https://forge.hackers.town/antijingoist/opendyslexic/archive/v$pkgver.tar.gz)
sha256sums=('c5e2e43220dd0c376203297e8d124534318827aa6ea27f9d24c82f401071841d')

package() {
  cd opendyslexic
  for otf in compiled/*.otf; do
    install -Dm644 $otf "$pkgdir"/usr/share/fonts/OTF/${otf##*/}
  done
  install -Dm644 OFL.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
