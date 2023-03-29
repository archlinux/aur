# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: VitalyR <vitalyankh@gmail.com>
# Contributor: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native-bin
_pkgver=2.1.0
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='Pure Scala Artifact Fetching (native-image edition)'
arch=('x86_64')
url='http://get-coursier.io'
license=('Apache')
provides=('coursier')
conflicts=('coursier' 'coursier-native')
depends=('zlib')
source=(
    "coursier-$pkgver.gz::https://github.com/coursier/coursier/releases/download/v$_pkgver/cs-x86_64-pc-linux.gz"
    "_cs"
)
sha256sums=('7ab9d7a7f0f29967e5e477f9628813aaf2cdeee0cf91db4532721ce9739d8469'
    'b357cc2a29dd10f9827c0a3945b98ba4aca562c58c947a8a2dc40a29115c4615')

package() {
    install -Dm755 "${srcdir}/coursier-${pkgver}" "${pkgdir}/usr/bin/cs"
    install -Dm644 "${srcdir}/_cs" "${pkgdir}/usr/share/zsh/site-functions/_cs"
}
