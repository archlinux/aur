# Maintainer: Graham Edgecombe <graham@grahamedgecombe.com>
pkgname=sleeksnap
pkgver=1.4.5
_gitsha=f6238190
pkgrel=1
pkgdesc='The user-friendly screenshot program'
arch=('any')
url='http://sleeksnap.com/'
license=('GPL3')
depends=('java-runtime')
makedepends=('unzip')
source=("http://cdn.probablyaserver.com/sleeksnap/Sleeksnap-${_gitsha}.jar"
        'sleeksnap'
        'sleeksnap.desktop')
noextract=("Sleeksnap-${_gitsha}.jar")
md5sums=('2d118ab6328cb5d26c94f53478672cd3'
         '142cfa8913ad1ab91f7638e4296367a4'
         '99013580a98f44a5f9f634d916bac7d2')

build() {
  cd "$srcdir"
  unzip -jo "Sleeksnap-${_gitsha}.jar" icon32x32.png
}

package() {
  cd "$srcdir"
  install -Dm755 "$srcdir/sleeksnap" "$pkgdir/usr/bin/sleeksnap"
  install -Dm644 "Sleeksnap-${_gitsha}.jar" "$pkgdir/usr/share/java/sleeksnap/sleeksnap.jar"
  install -Dm644 "$srcdir/sleeksnap.desktop" "$pkgdir/usr/share/applications/sleeksnap.desktop"
  install -Dm644 icon32x32.png "$pkgdir/usr/share/pixmaps/sleeksnap.png"
}
