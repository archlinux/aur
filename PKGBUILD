# Maintainer: Sebastian Wiesner <sebastian@swsnr.de>
# Contributor: VitalyR <vitalyankh@gmail.com>
# Contributor: amesgen <amesgen AT amesgen DOT de>

pkgname=coursier-native
_pkgver=2.1.0-RC6
pkgver="${_pkgver//-/_}"
pkgrel=1
pkgdesc='Pure Scala Artifact Fetching (native-image edition)'
arch=('x86_64')
url='http://get-coursier.io'
license=('Apache')
depends=('zlib')
source=("coursier-$pkgver.gz::https://github.com/coursier/coursier/releases/download/v$_pkgver/cs-x86_64-pc-linux.gz")
sha256sums=('ef2bc32c8d1975d9373f518ee24ecbd9a96e99cbb523afa309a45cb44009eeb7')

package() {
    install -Dm755 "coursier-$pkgver" "$pkgdir/usr/bin/cs"
    # FIXME: Completions don't seem to work anymore, see https://github.com/coursier/coursier/issues/2677
    # install -Dm644 <("$pkgdir/usr/bin/cs" --completions zsh) "$pkgdir/usr/share/zsh/site-functions/_cs"
}
