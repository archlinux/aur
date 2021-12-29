# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# The place where the .tar.gz is located is https://discord.gg/ygopro-percy

pkgname=edopro-bin
pkgver=39.2.0
pkgrel=1
pkgdesc="Free and open source ygopro client"
arch=('x86_64')
url='https://github.com/edo9300/edopro'
license=('AGPL3')
depends=('libglvnd')
optdepends=('mono: AI support')
source=(
	"$pkgname-$pkgver.tar.gz::https://github.com/projectignis/edopro-assets/releases/download/20210927/ProjectIgnis-EDOPro-$pkgver-linux.tar.gz"
	"io.github.edo9300.EDOPro.desktop"
	"edopro")
sha256sums=('3904964ee45a4f2af65c80e349b22fad5d752c90a93a6c3968e8c75368e2fa42'
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
