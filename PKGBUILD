# Maintainer: iboyperson <iboyperson@gmail.com>

pkgname=osx-arc-aurorae-theme-git
_reponame=OSX-Arc-Aurorae
pkgver=1.1.0.r1.g4bd5f1f
pkgrel=1
pkgdesc="An Aurorae theme designed to compliment @LinxGem33's OSX-Arc gtk themes"
arch=('i686' 'x86_64')
url="https://github.com/iboyperson/OSX-Arc-Aurorae"
license=('GPL 3.0')
depends=('kwin')
provides=("osx-arc-aurorae-theme")
conflicts=("osx-arc-aurorae-theme")
source=("git+https://github.com/iboyperson/$_reponame.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_reponame"
  git describe --long --tags | sed 's/-/.r/;s/-/./'
}

package() {
    mkdir -p "$pkgdir/usr/share/aurorae/themes"
    cp -r "$srcdir/$_reponame/OSX-Arc" "$pkgdir/usr/share/aurorae/themes/"
    cp -r "$srcdir/$_reponame/OSX-Arc-Dark" "$pkgdir/usr/share/aurorae/themes/"
}
