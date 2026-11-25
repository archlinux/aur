# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=obsidianarc-bin
pkgver=0.13.0
pkgrel=1
pkgdesc="Self-hosted AI platform with multi-provider routing, usage tracking and admin console"
arch=('x86_64' 'aarch64')
url="https://github.com/OnyxAxisOwO/ObsidianArc"
license=('MIT')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/obsidian-arc_v${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${pkgname}-${pkgver}-aarch64.tar.gz::${_dl}/obsidian-arc_v${pkgver}_linux_arm64.tar.gz")
sha256sums_x86_64=('922f479d3ad7e6c4987cc6399dc5810eb4ef73790721fde290dae2b5ce35bdbc')
sha256sums_aarch64=('6733cf7e6c8636acd3ded7bf4d5a177e3bf121ec11dd2ea52674b71b20782973')

package() {
  install -Dm755 "./obsidian-arc" "${pkgdir}/usr/bin/obsidian-arc"
  install -Dm644 "./LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm644 "./README.md" -t "${pkgdir}/usr/share/doc/${pkgname}"
}
