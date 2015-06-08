# Maintainer: Devin Christensen <quixoten at gmail dot com>
pkgname=otf-inconsolata-g-powerline-git
pkgver=r71.39c99c0
pkgrel=1
pkgdesc="Inconsolata-g for Powerline"
arch=('any')
url=('https://github.com/powerline/fonts')
license=('custom:SIL Open Font License, Version 1.0')
depends=(fontconfig xorg-font-utils )
makedepends=('git')
conflicts=(powerline-fonts powerline-fonts-git)
install=$pkgname.install
source=('git://github.com/powerline/fonts.git')
md5sums=('SKIP')

pkgver() {
  cd fonts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/fonts/Inconsolata-g
  find . -iname '*.otf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
