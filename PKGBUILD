pkgname=spicetify-bin
pkgver=2.43.2
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
sha256sums=('213d1a32c0e0ff29b3f274b960531945f5f00568ba858382cc13a8f8ba4879ea')

package() {
  install -dm755 "${pkgdir}/opt/spicetify"
  tar --no-same-owner -xzf "${srcdir}/spicetify-${pkgver}-linux-amd64.tar.gz" -C "${pkgdir}/opt/spicetify"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/spicetify/spicetify" "${pkgdir}/usr/bin/spicetify"
}
