# Contributor: Devin Christensen <quixoten at gmail dot com>
pkgname=otf-droid-sans-mono-powerline-git
pkgver=r202.e80e3eb
pkgrel=1
pkgdesc="Droid Sans Mono for Powerline"
arch=('any')
url='https://github.com/powerline/fonts'
license=('custom:Apache License, Version 2.0')
makedepends=('git')
conflicts=(powerline-fonts powerline-fonts-git)
source=('git+https://github.com/powerline/fonts.git')
md5sums=('SKIP')

pkgver() {
  cd fonts
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/fonts/DroidSansMono
  find . -iname '*.otf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
  install -Dm644 LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
