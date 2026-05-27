# Maintainer: sarovin86 <sarovin86@gmail.com>

pkgname=nono-ai-bin
_pkgname=nono
pkgver=0.59.0
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
            'd0b350c764dfea1bb43ad9f1a1e77f9292869d361a431e4a9d889dc56a86f0f5')
sha256sums_x86_64=('aac65016d102b4af7cae662ae69c5f3a1948cfd4a946440fe7e202f1063ad34c')
sha256sums_aarch64=('436c3ba1d955fa5ee4f95b481e7079be8b17001aa32e093cf04324b485de6a90')

package() {
  install -Dm755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "${srcdir}/LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
