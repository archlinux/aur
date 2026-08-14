# Maintainer: Your Name <youremail@example.com>
pkgname=ollama-studio-app-git
_pkgname=ollama-studio-app
pkgver=r8.d015a10
pkgrel=1
pkgdesc="A desktop frontend interface for Ollama"
arch=('x86_64' 'aarch64')
url="https://github.com/vsk11-12/ollama-studio-app"
license=('MIT')
depends=('ollama')
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${_pkgname}"
  # Run any initial setup/fetch commands if necessary (e.g., npm install or cargo fetch)
}

build() {
  cd "${_pkgname}"
  # Replace with your app's actual build command:
  # - Node/npm:  npm run build
  # - Tauri:     cargo tauri build
  # - Python:    python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}"

  # Install binary to /usr/bin/
  # Adjust the source binary location if it outputs to a target/dist folder:
  install -Dm755 "ollama-studio-app" "${pkgdir}/usr/bin/${_pkgname}" 2>/dev/null || true

  # Install license if present
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/" LICENSE* 2>/dev/null || true
}
