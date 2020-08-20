# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mocp-themes-git
pkgver=r16.c648a6a
pkgrel=1
pkgdesc="A collection of themes for the music on console player"
arch=('any')
url='https://github.com/wimstefan/mocp-themes'
provides=('mocp-themes')
license=('custom:unknown')
depends=('moc')
source=("mocp-themes::git+https://github.com/wimstefan/mocp-themes")
sha256sums=('SKIP')

pkgver() {
  cd mocp-themes
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd mocp-themes
  install -d "${pkgdir}/usr/share/moc/themes"
  rm -rf README.md
  cp * "${pkgdir}/usr/share/moc/themes"
}