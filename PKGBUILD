# Maintainer: egt-cs50 <lngcdang@gmail.com>
pkgname=tauri-wrap-git
pkgver=r1.0000000
pkgrel=1
pkgdesc="Wrap any URL as a Tauri desktop app on Arch Linux"
arch=('x86_64' 'aarch64')
url="https://github.com/egt-cs50/tauri-wrap"
license=('MIT')
depends=(
  'webkit2gtk'
  'gtk3'
  'librsvg'
  'openssl'
  'curl'
  'python'
  'python-pillow'
  'nodejs'
  'rust'
)
makedepends=('git')
provides=('tauri-wrap')
conflicts=('tauri-wrap')
source=("${pkgname}::git+https://github.com/egt-cs50/tauri-wrap.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname}/tauri-wrap"
  install -Dm755 tauri-wrap "${pkgdir}/usr/local/bin/tauri-wrap"
}
