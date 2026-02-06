# Maintainer: cyprien <ton-email>
pkgname=hugvi
pkgver=1.3.1
pkgrel=1
pkgdesc="A note-taking app for programmers with markdown syntax (Pre-built binary)"
arch=('x86_64')
url="https://github.com/cbdefontenay/hugvi"
license=('MIT')
depends=('gtk3' 'webkit2gtk-4.1' 'libnm' 'hicolor-icon-theme')
provides=('hugvi')
conflicts=('hugvi')

# On utilise le nouveau tag v-${pkgver}
source_x86_64=("${url}/releases/download/v-${pkgver}/Hugvi_${pkgver}_amd64.deb")
sha256sums_x86_64=('3bee8132c357325d88eed77906a91d2003d34e6a354c564158ac8cb46e34e6b7')

prepare() {
  # Extraction simplifiée puisqu'on n'a qu'une archi
  bsdtar -xf "Hugvi_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.*
}

package() {
  cp -r usr/ "$pkgdir/"

  # Le lien symbolique pour utiliser 'hugvi' en minuscule
  ln -sf /usr/bin/Hugvi "$pkgdir/usr/bin/hugvi"
}
