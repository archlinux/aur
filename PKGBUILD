pkgname=spicetify-bin
pkgver=2.44.0
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
sha256sums=('115045610a609a2084af389e65aa4f60351a4b8ef1497ce98bdbdf379544ef9b')

package() {
  install -dm755 "${pkgdir}/opt/spicetify"
  tar --no-same-owner -xzf "${srcdir}/spicetify-${pkgver}-linux-amd64.tar.gz" -C "${pkgdir}/opt/spicetify"

  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/spicetify/spicetify" "${pkgdir}/usr/bin/spicetify"
}
