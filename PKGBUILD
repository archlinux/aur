# Maintainer: HorneroOS contributors <https://github.com/HorneroOS/hornero>
# Native horneroctl binary from GitHub Releases (canonical distribution,
# same pattern as agent-toolkit-bin). _reltag + pkgver + per-arch
# sha256sums are patched at publish time by .github/workflows/release.yml;
# the zero placeholders below fail fast if this template is built directly.
# _reltag carries the real GitHub tag because pkgver must be
# makepkg-safe (no hyphens), while tags use hyphens (v0.2.0-preview2).
pkgname=horneroctl-bin
_reltag=horneroctl-v0.2.0-preview14.1
pkgver=0.2.0_preview14.1
pkgrel=1
pkgdesc='HorneroOS system CLI (native binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/HorneroOS/hornero'
license=('MIT')
options=('!strip')
source_x86_64=("horneroctl::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-x86_64")
source_aarch64=("horneroctl::https://github.com/HorneroOS/hornero/releases/download/${_reltag}/horneroctl-linux-arm64")
sha256sums_x86_64=('b9741478bf452d7bfce3b0003a01c0731ef716ed35fdd51b181f0e6f6a3b228c')
sha256sums_aarch64=('5c2c1a4f9afe8f1d296d67574ccc0ad53c0c28ff7379a2b20c5d4acab05e185e')

package() {
  install -Dm755 "${srcdir}/horneroctl" "${pkgdir}/usr/bin/horneroctl"
}
