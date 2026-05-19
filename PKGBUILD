# Maintainer: sarovin86 <sarovin86@gmail.com>

pkgname=nono-ai-bin
_pkgname=nono
pkgver=0.56.0
pkgrel=1
pkgdesc='Secure, kernel-enforced sandbox for AI agents, MCP servers and LLM workloads using Landlock (pre-built binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/always-further/nono'
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'dbus')
optdepends=(
  'gnome-keyring: Secret Service daemon for credential storage'
  'keepassxc: alternative Secret Service daemon'
)
provides=('nono-ai')
conflicts=("${_pkgname}" 'nono-ai' 'nono-ai-git')
options=('!strip' '!debug')
source=(
  "LICENSE-${pkgver}::https://raw.githubusercontent.com/always-further/nono/v${pkgver}/LICENSE"
  "README-${pkgver}.md::https://raw.githubusercontent.com/always-further/nono/v${pkgver}/README.md"
)
source_x86_64=("${_pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/always-further/nono/releases/download/v${pkgver}/nono-v${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
source_aarch64=("${_pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/always-further/nono/releases/download/v${pkgver}/nono-v${pkgver}-aarch64-unknown-linux-gnu.tar.gz")
sha256sums=('7310e9389f298b89bb2f90ac4b6081ed5b6a1c4a7b8547df5d52966a57cb0929'
            'a8f2602b8fdbf9a94a0d224892995767b3c31d8c33dba860c4b327c2831b0b19')
sha256sums_x86_64=('9f68637c5bac1ba7036249f4874f528a307cbeba6fa99b899129d45632041f58')
sha256sums_aarch64=('febe968c398b66268d4e81036adf5dc11ee88669cafdee026b2ea45be6eb9cbd')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
