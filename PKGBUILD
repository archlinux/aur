# Maintainer: k88936 email: kvtodev@outlook.com

pkgname=mihomosh
pkgver=2.0.0
pkgrel=1
pkgdesc="A CLI Toolkit for Mihomo"
arch=('x86_64')
url="https://github.com/k88936/mihomosh"
license=('GPL3')
depends=('openssl')
options=(!lto)
makedepends=('cargo' 'rust' 'base-devel' 'pkg-config')
source=("git+https://github.com/k88936/mihomosh.git")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/${pkgname}"
  export CARGO_PROFILE_RELEASE_LTO=false
  cargo build --profile release --locked
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  
  # Install license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
}
