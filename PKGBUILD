# Maintainer: Tom Hiller <thrilleratplay@gmail.com>
pkgname=notable-bin
pkgver=1.8.1
pkgrel=1
epoch=
pkgdesc="The markdown-based note-taking app that doesn't suck"
arch=('x86_64')
url="https://github.com/fabiospampinato/notable"
license=('Freeware')
groups=()
depends=('libxss')
makedepends=()
checkdepends=()
optdepends=()
provides=('notable')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/fabiospampinato/notable/releases/download/v${pkgver}/notable_${pkgver}_amd64.deb")
noextract=()
md5sums=('2026e307b45fcbbea760cfa3cf1875fc')
sha512sums=('b14a725a12f1ec555c08c31cd918faf86ff933fa324ac4898a8caee6b1c5bfc3ef2851529303dc286fbdadbdb1960dda7210ca40c81468d59c0b93ff1769d2e1')
validpgpkeys=()

package() {
  tar xf data.tar.xz

  # Work around for https://github.com/electron/electron/issues/17972
  chmod 4755 opt/Notable/chrome-sandbox

  mv usr "$pkgdir"
  mv opt "$pkgdir"
  mkdir "$pkgdir"/usr/bin/

  ln -s /opt/Notable/notable "$pkgdir"/usr/bin/notable
}
