# Maintainer: WH-2099 <wh2099@pm.me>
pkgname=openai-chatgpt
pkgver=26.803.81509
pkgrel=2
pkgdesc="OpenAI's ChatGPT desktop app for Linux (preview)"
arch=('x86_64' 'aarch64')
url='https://chatgpt.com/download/'
license=('LicenseRef-proprietary')
depends=(
  'alsa-lib'
  'at-spi2-core'
  'bash'
  'cairo'
  'coreutils'
  'dbus'
  'expat'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'libcups'
  'libdrm'
  'libgcc'
  'libglvnd'
  'libnotify'
  'libstdc++'
  'libusb'
  'libx11'
  'libxcb'
  'libxcomposite'
  'libxdamage'
  'libxext'
  'libxfixes'
  'libxkbcommon'
  'libxrandr'
  'mesa'
  'nspr'
  'nss'
  'pango'
  'systemd-libs'
  'tar'
  'xdg-utils'
  'xz'
)
depends_x86_64=(
  'graphite'
  'openssl'
)
optdepends=(
  'apparmor: allow the Electron sandbox to use user namespaces when AppArmor is enabled'
  'git: repository workflows'
  'openssh: remote SSH workspaces'
  'org.freedesktop.secrets: secure credential storage'
  'pipewire: WebRTC desktop sharing under Wayland'
)
provides=("openai-chatgpt-bin=$pkgver" "chatgpt-desktop=$pkgver")
conflicts=('chatgpt' 'chatgpt-desktop' 'openai-codex-desktop')
backup=('etc/apparmor.d/chatgpt')
options=('!strip' '!debug')
install='openai-chatgpt.install'
source=('OpenAI-Proprietary-Notice')
source_x86_64=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/chatgpt/chatgpt_${pkgver}_amd64.deb")
source_aarch64=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/chatgpt/chatgpt_${pkgver}_arm64.deb")
sha256sums=('45cffaa1435cab2a50b340850bb2e9684e8c561635d091465d576e5dcf679af5')
sha256sums_x86_64=('a9bf91a368f9f7c4eea38082a9fb8fb46b8d005b719a6d7715d2e5a1982c38eb')
sha256sums_aarch64=('f38fcc194eca9ab0327dc10c92340681eae77c5d75164df700384ce2adaccbc1')

package() {
  bsdtar --no-same-owner -xf data.tar.xz -C "$pkgdir" ./etc ./usr
  install -Dm644 OpenAI-Proprietary-Notice "$pkgdir/usr/share/licenses/$pkgname/PROPRIETARY"
}
