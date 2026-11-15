# Maintainer: ginkcode <ginkcode@gmail.com>
#
# Generated from packaging/arch/PKGBUILD.in in
# https://github.com/ginkcodex/agent-sessions by render-pkgbuild.sh;
# change the template there, not this file.

pkgname=agent-sessions-bin
_pkgname=agent-sessions
pkgver=1.6.5
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
sha256sums_x86_64=('8ec316cb24d08895aef6e4e0c2e124372b673d2e09dea78a98f0d1f73562827b')
sha256sums_aarch64=('2ed28a3baab6a9ee75f635763cb15697048846a57889b2d91479951947e67133')

package() {
  # makepkg unpacks the .deb into debian-binary, control.tar.* and data.tar.*.
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
