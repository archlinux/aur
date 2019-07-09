# Maintainer: Tom Hiller <thrilleratplay@gmail.com>
pkgname=notable-bin
pkgver=1.6.0
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
md5sums=('3a8a959f59fb60a121cdf03038d479ca')
sha512sums=('c901c5381b32ca35a55683683199669ff3e723e0611f867e7ec65157cec84399bbf9d0370ed4e68dd403daa78bf5d74352396011c40cbccfd219159c33104dc0')
validpgpkeys=()

package() {
  tar xf data.tar.xz

  # replace script that was added as a result of https://github.com/notable/notable/issues/658
  echo -e '#!/bin/bash\n/opt/Notable/notable.bin "$@" --no-sandbox' > opt/Notable/notable
  chmod 755 opt/Notable/notable

  mv usr "$pkgdir"
  mv opt "$pkgdir"
  mkdir "$pkgdir"/usr/bin/

  ln -s /opt/Notable/notable "$pkgdir"/usr/bin/notable
}
