# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/hornero>
# Native horneroctl binary from GitHub Releases (canonical distribution,
# same pattern as agent-toolkit-bin). _reltag + pkgver + per-arch
# sha256sums are patched at publish time by .github/workflows/release.yml;
# the zero placeholders below fail fast if this template is built directly.
# _reltag carries the real GitHub tag because pkgver must be
# makepkg-safe (no hyphens), while tags use hyphens (v0.2.0-preview2).
pkgname=horneroctl-bin
_reltag=horneroctl-v0.2.0-preview2
pkgver=0.2.0_preview2
pkgrel=1
pkgdesc='HorneroOS system CLI (native binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/HorneroOS/hornero'
license=('MIT')
options=('!strip')
source_x86_64=("horneroctl::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-x86_64")
source_aarch64=("horneroctl::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-arm64")
sha256sums_x86_64=('1ada392af8d5f1a017c493f4887c43ba11cea19e50313550508eab7103a9ac62')
sha256sums_aarch64=('38c4e4201abce30cc33f64b58d26035027700079e6b5e72a6d553a26708e0d0b')

package() {
  install -Dm755 "${srcdir}/horneroctl" "${pkgdir}/usr/bin/horneroctl"
}
