# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Linus Dierheimer <Linus@Dierheimer.de>

pkgname=ghost-dl-bin
pkgver=v1.1.3
pkgrel=1
pkgdesc="Kingdom Hearts Insider Game OST Archive Dowloader CLI"
arch=(x86_64)
url="https://github.com/TheElevatedOne/ghost-dl"
license=(GPL3)
depends=(glibc gcc python python-pip)
options=('!debug' '!strip')
provides=(ghost-dl-bin)
conflicts=(ghost-dl-git)
source=("https://github.com/TheElevatedOne/ghost-dl/releases/download/${pkgver}/ghost-dl_ubuntu-latest.tar.gz")
sha256sums=("SKIP")

package() {
  set -e
  cd "${srcdir}"

  mkdir -p extracted
  tar -xzf "ghost-dl_ubuntu-latest.tar.gz" -C extracted
  install -Dm755 "extracted/ghost-dl" "${pkgdir}/usr/bin/ghost-dl"
  install -Dm644 "extracted/LICENSE" "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
}
