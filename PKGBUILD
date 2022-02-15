# Maintainer: Star_caorui <Star_caorui@hotmail.com>
pkgname=fakeq-git
pkgver=0.1.0
pkgrel=1
pkgdesc="fakeq is a fake qq client."
arch=(x86_64)
url="https://github.com/Star-caorui/fakeq"
license=(MIT)
depends=('gtk3' 'webkit2gtk')
makedepends=('git' 'cargo' 'yarn' 'appmenu-gtk-module' 'libappindicator-gtk3' 'patchelf' 'librsvg' 'libvips' 'wget')
source=('fakeq-git::git+https://github.com/Star-caorui/fakeq')
sha256sums=('SKIP')

build() {
  cd ${pkgname}
  yarn
  yarn run tauri build
}

package() {
  cd ${pkgname}/src-tauri/target/release/bundle/deb/fakeq_${pkgver}_amd64/data
  install -dm755 "${pkgdir}"/usr
  cp -r ./usr/* "${pkgdir}"/usr/
}
