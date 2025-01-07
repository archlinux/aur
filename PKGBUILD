# Maintainer: Uwe Krause <uwe at uwekrau dot se>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=mocp-themes-git
pkgver=r18.3578cd9
pkgrel=1
pkgdesc="A collection of themes for the music on console player"
arch=('any')
url='https://github.com/wimstefan/mocp-themes'
provides=('mocp-themes')
license=('custom:unknown')
depends=('moc')
makedepends=('git')
source=("mocp-themes::git+https://github.com/wimstefan/mocp-themes")
sha256sums=('SKIP')

pkgver() {
  cd mocp-themes || exit
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd mocp-themes || exit
  install -d "${pkgdir}/usr/share/moc/themes"
  rm -rf README.md
  rm -rf Screenshots
  cp ./* "${pkgdir}/usr/share/moc/themes"
}
