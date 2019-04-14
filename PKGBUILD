# Maintainer: Alex Gagne (SpectralMemories) <aaalex12gagne@gmail.com>
# Contributor: Mélanie Chauvel (ariasuni) <perso@hack-libre.org>

_pkgname='phantomjs'
pkgname="$_pkgname-beta-bin"
pkgver="2.5.0"
pkgrel=2
pkgdesc='Headless WebKit with JavaScript API (official beta binaries)'
url='http://www.phantomjs.org/'
license=('BSD')
arch=('x86_64')
depends=('fontconfig' 'freetype2' 'libpng' 'libpng12')
conflicts=('phantomjs' 'phantomjs-bin')
provides=('phantomjs')
_path="phantomjs-$pkgver-beta-ubuntu-xenial"
_filename="phantomjs-$pkgver-beta-linux-ubuntu-xenial-x86_64.tar.gz"
source=("https://bitbucket.org/ariya/phantomjs/downloads/$_filename")
sha256sums=('b478bb44e7a77468683a615bda082716d76e99dc17ebbc005d31d06b6715429e')

package() {
    install -Dm755 "$srcdir/$_path/bin/phantomjs" "$pkgdir/usr/bin/phantomjs"
    install -Dm755 "$srcdir/$_path/LICENSE.BSD" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -dm755 "$pkgdir"/usr/share/$_pkgname/examples
    cp -r "$srcdir/$_path/examples" "$pkgdir/usr/share/$_pkgname/"
}
