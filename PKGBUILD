pkgname=spicetify-bin
pkgver=2.43.1
pkgrel=1
pkgdesc='Command-line tool to customize the official Spotify client'
arch=('x86_64')
url='https://github.com/spicetify/cli'
license=('LGPL-2.1-or-later')
depends=()
provides=('spicetify-cli' 'spicetify')
conflicts=('spicetify-cli' 'spicetify')
source=(
  "https://github.com/spicetify/cli/releases/download/v${pkgver}/spicetify-${pkgver}-linux-amd64.tar.gz"
)
noextract=("spicetify-${pkgver}-linux-amd64.tar.gz")
sha256sums=(
  '7fa397907763f9bb3252fe0f32c82efea9a923c890045b742c6e5399f917cdbe'
)

package() {
  install -dm755 "${pkgdir}/opt/spicetify"
  tar --no-same-owner -xzf "${srcdir}/spicetify-${pkgver}-linux-amd64.tar.gz" -C "${pkgdir}/opt/spicetify"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/spicetify/spicetify" "${pkgdir}/usr/bin/spicetify"
}
