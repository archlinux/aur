pkgname=trinity-cli
pkgver=1.0.1
pkgrel=1
pkgdesc="Sacred Intelligence CLI — Trinity v1.0.1 PURITY"
arch=('x86_64' 'aarch64')
url="https://github.com/gHashTag/trinity"
license=('MIT')
depends=()
makedepends=('zig')
source=("https://github.com/gHashTag/trinity/releases/download/v1.0.1/trinity-v1.0.1-linux-x86_64.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}"
  # Extract archive
  tar -xzf trinity-v1.0.1-linux-x86_64.tar.gz
}

package() {
  cd "${srcdir}"
  install -Dm755 tri "${pkgdir}/usr/bin/tri"
  install -Dm644 tri.bash "${pkgdir}/usr/share/bash-completion/completions/tri"
  install -Dm644 tri.zsh "${pkgdir}/usr/share/zsh/site-functions/_tri"
  install -Dm644 tri.fish "${pkgdir}/usr/share/fish/vendor_completions.d/tri.fish"
}
