# Maintainer: Tom Hiller <thrilleratplay@gmail.com>
pkgname=notable-bin
pkgver=1.7.1
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
md5sums=('cf46deeb84cac3cdb10c68215416b3aa')
sha512sums=('36dda14a0cb451f3c079c02208bc8b42b81cd90db800e94d8d3ae4d5c513c2fe7548cf60fde73fed3d230f96572341a2990881940d6c77204a48070671d449da')
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
