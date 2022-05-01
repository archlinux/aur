pkgname=mqttui-bin
pkgver=0.16.2
pkgrel=1
pkgdesc="Subscribe to a MQTT Topic or publish something quickly from the terminal"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/EdJoPaTo/${pkgname/-bin/}"
license=('GPL3')
depends=('gcc-libs')
provides=("${pkgname/-bin/}")
conflicts=("${pkgname/-bin/}")

source_x86_64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
source_armv6h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-arm-unknown-linux-gnueabihf.tar.gz")
source_armv7h=("$url/releases/download/v${pkgver}/${pkgname/-bin/}-v${pkgver}-armv7-unknown-linux-gnueabihf.tar.gz")

sha256sums_x86_64=('180f62e9c4d23b239cbe523a585aa31c47b2d24300ea4cd7e5aa29d83cb02cec')
sha256sums_aarch64=('cbaf568a80c5b0f6b2a3d2a539b3476fce6567bb2f6271dec619250cfc5709fe')
sha256sums_armv6h=('f2ca7f7b2889d93c4f649478f4ad9cbd086f85610ac884e4806568797bf7eeb2')
sha256sums_armv7h=('82942e3e5750141dcdc66b681a55a9a400e38fec9510f8d1cbda897e394beda3')

package() {
  install -Dm755 "${pkgname/-bin/}" "${pkgdir}/usr/bin/${pkgname/-bin/}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname/-bin/}/LICENSE"
  install -Dm644 README.md -t "$pkgdir"/usr/share/doc/$pkgname

  install -Dm644 "completions/${pkgname/-bin/}.bash" "${pkgdir}/usr/share/bash-completion/completions/${pkgname/-bin/}.bash"
  install -Dm644 "completions/${pkgname/-bin/}.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/${pkgname/-bin/}.fish"
  install -Dm644 "completions/_${pkgname/-bin/}" "${pkgdir}/usr/share/zsh/site-functions/_${pkgname/-bin/}"
}
