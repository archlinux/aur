# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: VitalyR <vitalyankh@gmail.com>
# Contributor: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native-bin
pkgver=2.1.4
pkgrel=1
pkgdesc='Pure Scala Artifact Fetching (native-image edition)'
arch=('x86_64')
url='http://get-coursier.io'
license=('Apache')
provides=('coursier')
conflicts=('coursier' 'coursier-native')
depends=('zlib')
source=(
    "coursier-$pkgver.gz::https://github.com/coursier/coursier/releases/download/v$pkgver/cs-x86_64-pc-linux.gz"
    "_cs"
)
b2sums=('33009be5bc0a8ee415bd08d5e13cace34011ab2733c5a0aff47e7e5eb4254b4e4205b0580d1df6bb6b38d66059ffab7f929fa83c50f1bd052d3c3dffffc73dd0'
    '13ec0eb81b93cf3483ac5aa703729bceb2eff8cc1a5c11c9dfcfb392e0ceb8c9a06718cc8d3a4da749e1c307a30cc3e1e5e4c174ff0d4666278d7a38382c6902')

package() {
    install -Dm755 "${srcdir}/coursier-${pkgver}" "${pkgdir}/usr/bin/cs"
    install -Dm644 "${srcdir}/_cs" "${pkgdir}/usr/share/zsh/site-functions/_cs"
}
