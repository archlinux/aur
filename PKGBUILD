# Maintainer: sk <sk at sk dot sk>

pkgname=noteriv-bin
pkgver=2.2.1
pkgrel=1
pkgdesc="A fast, open-source markdown editor with graph view, plugin API, themes, Git/WebDAV sync, and AI MCP server — built on Tauri 2"
arch=('x86_64')
url="https://github.com/thejacedev/Noteriv"
license=('MIT')
depends=('webkit2gtk-4.1' 'libsoup3' 'gtk3')
makedepends=()
provides=("${pkgname%-bin}=${pkgver}")
conflicts=("${pkgname%-bin}")
source=("noteriv_${pkgver}_amd64.deb::https://github.com/thejacedev/Noteriv/releases/download/v${pkgver}/Noteriv_${pkgver}_amd64.deb")
sha256sums=('17b1a80be8360d3523703aa3923866b2971b118f40d42de17811654970bfd2c1')

package() {
  cd "${srcdir}"
  bsdtar xf "noteriv_${pkgver}_amd64.deb"
  bsdtar xf data.tar.gz -C "${pkgdir}"
}
