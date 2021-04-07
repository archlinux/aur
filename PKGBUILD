# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Devin Christensen <quixoten at gmail dot com>
pkgname=ttf-ubuntu-mono-derivative-powerline-git
pkgver=r202.e80e3eb
pkgrel=1
pkgdesc="Ubuntu Mono derivative Powerline"
arch=('any')
url='https://github.com/powerline/fonts'
license=('custom:Ubuntu Font License, Version 1.0')
depends=(fontconfig)
makedepends=('git')
conflicts=(powerline-fonts powerline-fonts-git)
source=('git+https://github.com/powerline/fonts.git')
sha256sums=('SKIP')

pkgver() {
  cd fonts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/fonts/UbuntuMono
  find . -iname '*.ttf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
  install -Dm644 LICENCE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
