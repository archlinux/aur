# Maintainer: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_pkgname='phantomjs'
pkgname="$_pkgname-bin"
pkgver=2.1.1
pkgrel=2
pkgdesc='Headless WebKit with JavaScript API (official static binary)'
url='http://phantomjs.org/'
license=('BSD')
arch=('x86_64')
depends=('fontconfig' 'freetype2' 'libpng')
conflicts=('phantomjs')
provides=('phantomjs')
_path="phantomjs-$pkgver-linux-x86_64"
source=("https://bitbucket.org/ariya/phantomjs/downloads/$_path.tar.bz2")
sha256sums=('86dd9a4bf4aee45f1a84c9f61cf1947c1d6dce9b9e8d2a907105da7852460d2f')

package() {
  install -Dm755 "$srcdir/$_path/bin/phantomjs" "$pkgdir/usr/bin/phantomjs"
  install -Dm755 "$srcdir/$_path/LICENSE.BSD" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -dm755 "$pkgdir"/usr/share/$_pkgname/examples
  cp -r "$srcdir/$_path/examples" "$pkgdir/usr/share/$_pkgname/"
}
