# Maintainer: lmartinez-mirror
# Maintainer: Solomon Choina <shlomochoina@gmail.com>
# The place where the .tar.gz is located is https://discord.gg/ygopro-percy
DLAGENTS=(https::/usr/bin/megadl --no-progress %u)
pkgname=edopro-bin
pkgver=39.0.3
pkgrel=1
pkgdesc="Free and open source ygopro client"
arch=('x86_64')
url='https://github.com/edo9300/edopro'
license=('AGPL3')
depends=('libglvnd')
makedepends=('megatools')
optdepends=('mono: AI support')
source=("ProjectIgnis-EDOPro-$pkgver-linux.tar::https://mega.nz/file/ACglSKaC#Mhu-KfVoO4UgWmMkZLULpp531KdoiocylEhHisXZ3Ls"
        "io.github.edo9300.EDOPro.desktop"
        "edopro")
sha256sums=('472bc831c0a22f0a619d1fb4cc1b39af14f0bda74bf0a96a821038d711c700bb'
            '831c8d915064e997162ee172af1765b3105e8191f914b013317b3efa3906ef96'
            '149301c11a921742180535d77df7e2c89e486ef8cb6c5e6e33202dccc03a9ec7')
options=('emptydirs')

package() {
  cd ProjectIgnis

  install -dm 777 "$pkgdir/opt/edopro"
  install -Dm 777 EDOPro -t "$pkgdir/opt/edopro/"
  install -Dm 777 "$srcdir/edopro" "$pkgdir/usr/bin/edopro"
  install -Dm 644 libocgcore.so -t "$pkgdir/opt/edopro"
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  find config expansions fonts notices script skin sound textures WindBot \
    -type f -exec install -Dm 777 '{}' "$pkgdir/opt/edopro/{}" \;
  install -D "$srcdir/io.github.edo9300.EDOPro.desktop" \
    -t "$pkgdir/usr/share/applications/"
}
