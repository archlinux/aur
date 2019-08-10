# Maintainer: Tom Hiller <thrilleratplay@gmail.com>
pkgname=notable-bin
pkgver=1.7.0
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
md5sums=('61dc0c4fbda445e83cfa6f105bcd7f38')
sha512sums=('ec095ec77526bf32f2779d6497bc7288905664def4df60b0280934506c3555b0f6d31be042d59df0c0789afcc344c1c684867eaf9cca98de09808c5ef169a9a8')
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
