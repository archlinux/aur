# Maintainer: Luis Martinez <luis dot martinez at tuta dot io>
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# The place where the .tar.gz is located is https://discord.gg/ygopro-percy

DLAGENTS=(https::/usr/bin/megadl --no-progress %u)

pkgname=edopro-bin
pkgver=39.1.0
pkgrel=1
pkgdesc="Free and open source ygopro client"
arch=('x86_64')
url='https://github.com/edo9300/edopro'
license=('AGPL3')
depends=('libglvnd')
makedepends=('megatools')
optdepends=('mono: AI support')
source=("ProjectIgnis-EDOPro-$pkgver-linux.tar.gz::https://mega.nz/file/lLYzhKzS#8hueM0Qb8LQMspE2NiCZ7-IRditGG1lydbnyLZ9PRCk"
        "io.github.edo9300.EDOPro.desktop"
        "edopro")
sha256sums=('590b328c764414c966d7eb8035df57161341ebd2940623751529319c678074df'
            '831c8d915064e997162ee172af1765b3105e8191f914b013317b3efa3906ef96'
            '149301c11a921742180535d77df7e2c89e486ef8cb6c5e6e33202dccc03a9ec7')
options=('emptydirs')

package() {
  cd ProjectIgnis

  install -d "$pkgdir/opt/edopro/"
  cp -a * "$pkgdir/opt/edopro/"
  install -Dm 755 "$srcdir/edopro" "$pkgdir/usr/bin/edopro"
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -D "$srcdir/io.github.edo9300.EDOPro.desktop" \
    -t "$pkgdir/usr/share/applications/"
}
