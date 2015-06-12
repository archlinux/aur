pkgname=bugzilla-l10n-ja
pkgver=4.4.5
pkgrel=1
pkgdesc="japanese localization for bugzilla"
arch=(any)
url="http://www.bug-ja.org/"
license=('GPL')
depends=('bugzilla')
options=()
source=("bugzilla-$pkgver.ja::svn+http://svn.bug-ja.org/bugzilla/bugzilla-l10n-ja-4.4/tags/$pkgver/")
md5sums=('SKIP')

package() {
  mkdir -p $pkgdir/srv/http/bugzilla/template
  cp -a $srcdir/bugzilla-$pkgver.ja/template/ja $pkgdir/srv/http/bugzilla/template/ja
  find $pkgdir/srv/http/bugzilla -type f -exec chmod 0644 {} \;
  find $pkgdir/srv/http/bugzilla -type d -exec chmod 0755 {} \;
}
