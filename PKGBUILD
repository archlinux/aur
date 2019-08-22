# Maintainer: Tom Hiller <thrilleratplay@gmail.com>
pkgname=notable-bin
pkgver=1.7.3
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
md5sums=('cfe8d43fd47b81a8a12db4e09e13db05')
sha512sums=('206a96ca0615d715e523e238395386b0c12d295276ea104923d0edc07e18fbcab2aaeef5c112da082bf8680a9f5bef3c81f22baa49090238e2607151bb8acde7')
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
