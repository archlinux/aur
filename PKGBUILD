# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: VitalyR <vitalyankh@gmail.com>
# Contributor: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native-bin
pkgver=2.1.1
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
sha256sums=(
    '2d20f7acea22d8fb61a23e171a8f75cbf023e6c7f84c7c88cd794fbfcfaf6aeb'
    'ba53fc4358ddfab0fdda731dfdd8b30873726aa1b9065afe1c58e3f81b306408'
)

package() {
    install -Dm755 "${srcdir}/coursier-${pkgver}" "${pkgdir}/usr/bin/cs"
    install -Dm644 "${srcdir}/_cs" "${pkgdir}/usr/share/zsh/site-functions/_cs"
}
