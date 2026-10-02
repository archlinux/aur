# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/hornero>
# Native horneroctl binary from GitHub Releases (canonical distribution,
# same pattern as agent-toolkit-bin). _reltag + pkgver + per-arch
# sha256sums are patched at publish time by .github/workflows/release.yml;
# the zero placeholders below fail fast if this template is built directly.
# _reltag carries the real GitHub tag because pkgver must be
# makepkg-safe (no hyphens), while tags use hyphens (v0.2.0-preview2).
pkgname=horneroctl-bin
_reltag=horneroctl-v0.2.0-preview14
pkgver=0.2.0_preview14
pkgrel=1
pkgdesc='HorneroOS system CLI (native binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/HorneroOS/hornero'
license=('MIT')
options=('!strip')
source_x86_64=("horneroctl::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-x86_64")
source_aarch64=("horneroctl::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-arm64")
sha256sums_x86_64=('3200a7598b60d5adac92e82589997c55aa3c43e47575065af025e7ace490049a')
sha256sums_aarch64=('dd9e7d2fe60a2d1d2dcfbe26fed87d7feeef7ab11d1bd5cfae2d86123802b07b')

package() {
  install -Dm755 "${srcdir}/horneroctl" "${pkgdir}/usr/bin/horneroctl"
}
