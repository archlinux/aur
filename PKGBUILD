# Maintainer: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>

pkgname=stikked-git
_gitname='Stikked'
pkgver=0.8.5.2.g2ab968b
pkgrel=1
pkgdesc="An advanced and beautiful pastebin written in PHP"
arch=('any')
url="https://github.com/claudehohl/Stikked"
license=('GPL')
depends=('php')
provides=('stikked')
conflicts=('stikked')
backup=('etc/webapps/stikked/stikked.php')
install=$pkgname.install
source=('git+https://github.com/claudehohl/Stikked.git')
sha1sums=('SKIP')

pkgver() {
  cd "$srcdir/$_gitname"
  git describe --always | sed 's|-|.|g'
}

package() {
  cd "$srcdir/$_gitname/htdocs"

  mkdir -p "$pkgdir/usr/share/webapps/Stikked" "$pkgdir/etc/webapps/stikked"
  cp -ra * .htaccess "$pkgdir/usr/share/webapps/Stikked"
  mv "$pkgdir/usr/share/webapps/Stikked/application/config/stikked.php" \
     "$pkgdir/etc/webapps/stikked"
  ln -s "/etc/webapps/stikked/stikked.php" \
        "$pkgdir/usr/share/webapps/Stikked/application/config/stikked.php"
}

# vim:set ts=2 sw=2 et:
