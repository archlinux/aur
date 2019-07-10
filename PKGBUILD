# Maintainer: Tom Hiller <thrilleratplay@gmail.com>
pkgname=notable-bin
pkgver=1.6.2
pkgrel=1
epoch=
pkgdesc="The markdown-based note-taking app that doesn't suck"
arch=('x86_64')
url="https://github.com/fabiospampinato/notable"
license=('AGPL')
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
md5sums=('1ff210e98bcc68f28ba2f62605fe826d')
sha512sums=('1655e8142bb3a69fd93329f9f04f1bc13fb1ea33b3293f4551c9e1a506eb0341417fc8bac7581cd44a166301f814e09215a1feba96cf3063e17a69122da4b258')
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
