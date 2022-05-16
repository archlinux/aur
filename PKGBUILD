# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# The place where the .tar.gz is located is https://discord.gg/ygopro-percy

pkgname=edopro-bin
pkgver=39.3.1
pkgrel=1
pkgdesc="Free and open source ygopro client"
arch=('x86_64')
url='https://github.com/edo9300/edopro'
license=('AGPL3')
depends=('libglvnd')
optdepends=('mono: AI support')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/projectignis/edopro-assets/releases/download/$pkgver/ProjectIgnis-EDOPro-$pkgver-linux.tar.gz"
	"io.github.edo9300.EDOPro.desktop"
	"edopro")
sha256sums=('73b13b93a98a7d796d8a49d1d4902c0bbf3fab8fb2a63275f41d8f0495f69c4e'
            '831c8d915064e997162ee172af1765b3105e8191f914b013317b3efa3906ef96'
            '149301c11a921742180535d77df7e2c89e486ef8cb6c5e6e33202dccc03a9ec7')
options=('emptydirs')

package() {
  cd ProjectIgnis

  install -d "$pkgdir/opt/edopro/"
  cp -a * "$pkgdir/opt/edopro/"
  install -D "$srcdir/edopro" "$pkgdir/usr/bin/edopro"
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D "$srcdir/io.github.edo9300.EDOPro.desktop" \
    -t "$pkgdir/usr/share/applications/"
}
