# Maintainer: ginkcode <ginkcode@gmail.com>
#
# Generated from packaging/arch/PKGBUILD.in in
# https://github.com/ginkcodex/agent-sessions by render-pkgbuild.sh;
# change the template there, not this file.

pkgname=agent-sessions-bin
_pkgname=agent-sessions
pkgver=1.7.0
pkgrel=1
pkgdesc='Desktop GUI to browse and manage agentic coding sessions (Claude Code, Codex CLI, OpenCode)'
arch=('x86_64' 'aarch64')
url='https://github.com/ginkcodex/agent-sessions'
license=('PolyForm-Noncommercial-1.0.0')
# Libraries the binary links directly (namcap lists them).
depends=('glibc' 'glib2' 'gtk4' 'webkitgtk-6.0' 'libsoup3' 'libx11')
provides=("$_pkgname")
conflicts=("$_pkgname")
# The release binary is built stripped (-s -w); the servers are gzip archives.
options=('!strip' '!debug')
source=('LICENSE')
source_x86_64=("$_pkgname-$pkgver-x86_64.deb::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("$_pkgname-$pkgver-aarch64.deb::$url/releases/download/v$pkgver/${_pkgname}_${pkgver}_arm64.deb")
sha256sums=('ffcca38841adb694b6f380647e15f17c446a4d1656fed51a1e2041d064c94cc8')
sha256sums_x86_64=('d86763c5277f11a6f15953c5b238f8803214683dca1a0265ecdef07be2f1fbe4')
sha256sums_aarch64=('10ec7ffeff096315497d737481582e547df7476c6d8a74a9a68ce49b31f77270')

package() {
  # makepkg unpacks the .deb into debian-binary, control.tar.* and data.tar.*.
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
