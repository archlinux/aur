# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
# PKGBUILD/install/wrapper all shamelessly ripped off from [community]/dwarffortress

pkgname=arcanefortune
pkgver=0.1.0
pkgrel=1
pkgdesc="A game of empire building, diplomacy, conquest, construction, and deconstruction"
arch=('x86_64')
url="https://arcanefortune.com"
license=('CC BY-NC-SA 4.0')
options=(!strip !emptydirs)
install=arcanefortune.install
source=("${url}/releases/arcane_fortune_v${pkgver//./_}_linux.zip"
        arcane_fortune)

sha512sums=('ca81299acceb6a4fb4744dd7618f852ca02b12db6b1bccc6c62cd75bcbb50ac5ec89349bd06d8763596148adac69c02cf87cbd549e3cba74bab7304b9513198e'
            '52fab1757d298fe1d78596ad7965a618c1bebca2094be377e33cd10c5aa66a37ed6eb9bb3ea1a36f204946656e1ac5b4eab3c993b6a30e9a90f91d3661090d5a')

package() {
  install -dm755 "${pkgdir}/opt"
  install -Dm755 arcane_fortune "${pkgdir}/usr/bin/arcane_fortune"
  cp -r "${srcdir}/arcane_fortune_v${pkgver//./_}_linux" "${pkgdir}/opt/arcanefortune"
  install -Dm644 "${srcdir}/arcane_fortune_v${pkgver//./_}_linux/readme.txt" "${pkgdir}/usr/share/licenses/${pkgname}/readme.txt"
}
