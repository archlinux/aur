# Maintainer: Oleg Plakhotniuk <olegus8@gmail.com>
pkgname=webgetpics
pkgver=1.0.0
pkgrel=1
pkgdesc="Sets random pictures from web search as X background."
arch=('any')
url="http://www.webgetpics.org"
license=('custom')
depends=('curl' 'python2' 'wget' 'imagemagick' 'feh')
source=("git+https://github.com/webgetpics/webgetpics#tag=${pkgver}")
md5sums=('SKIP')

package() {
    cd "$srcdir/$pkgname"
    mkdir -p "$pkgdir"/usr/{bin,lib/webgetpics,share/{licenses,doc}/webgetpics}
    ln -s /usr/lib/webgetpics/webgetpics "$pkgdir/usr/bin/webgetpics"
    cp -r src/* "$pkgdir/usr/lib/webgetpics"
    cp LICENSE "$pkgdir/usr/share/licenses/webgetpics"
    cp README.md "$pkgdir/usr/share/doc/webgetpics"
}
