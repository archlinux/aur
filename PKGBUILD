# Maintainer: WH-2099 <wh2099@pm.me>
pkgname=openai-chatgpt-bin
pkgver=26.803.81509
pkgrel=1
pkgdesc='Official ChatGPT desktop app for Linux with Codex (preview)'
arch=('x86_64' 'aarch64')
url='https://chatgpt.com/codex/'
license=('LicenseRef-OpenAI-Terms-of-Use')
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
  'graphite'
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
  'openssl'
  'pango'
  'systemd-libs'
  'xdg-utils'
  'xz'
)
optdepends=(
  'git: repository workflows'
  'org.freedesktop.secrets: secure credential storage'
)
provides=("openai-chatgpt=$pkgver" "chatgpt-desktop=$pkgver")
conflicts=('openai-chatgpt' 'chatgpt' 'chatgpt-desktop' 'chatgpt-desktop-bin' 'openai-codex-desktop')
options=('!strip' '!debug')
source=('OpenAI-Terms-of-Use')
source_x86_64=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/chatgpt/chatgpt_${pkgver}_amd64.deb")
source_aarch64=("https://persistent.oaistatic.com/codex-app-prod/linux/deb/pool/main/c/chatgpt/chatgpt_${pkgver}_arm64.deb")
sha256sums=('c8d20129e5b1e349f7f03a878334298bf3a8d7ca4e8ba66ba83869433aa93bac')
sha256sums_x86_64=('a9bf91a368f9f7c4eea38082a9fb8fb46b8d005b719a6d7715d2e5a1982c38eb')
sha256sums_aarch64=('f38fcc194eca9ab0327dc10c92340681eae77c5d75164df700384ce2adaccbc1')

package() {
  bsdtar --no-same-owner -xf data.tar.xz -C "$pkgdir" ./usr
  rm -r "$pkgdir/usr/share/lintian"
  install -Dm644 OpenAI-Terms-of-Use "$pkgdir/usr/share/licenses/$pkgname/OpenAI-Terms-of-Use"
}
