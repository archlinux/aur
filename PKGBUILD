# Maintainer: ginkcode <ginkcode@gmail.com>
#
# Generated from packaging/arch/PKGBUILD.in in
# https://github.com/ginkcodex/agent-sessions by render-pkgbuild.sh;
# change the template there, not this file.

pkgname=agent-sessions-bin
_pkgname=agent-sessions
pkgver=1.7.2
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
sha256sums_x86_64=('66c6713a239d297d6736ed651b38599e393290c86b5a6cc88aa605de9b33a674')
sha256sums_aarch64=('8367352c35c805eb321df06da8db9c25546bcb0b2b28619f1e7288ce4d8335df')

package() {
  # makepkg unpacks the .deb into debian-binary, control.tar.* and data.tar.*.
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
