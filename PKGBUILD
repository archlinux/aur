# Maintainer: Thomas Jost <schnouki+aur@schnouki.net>
pkgname=git-extras
pkgver=1.5.1
_pkgtag=bbd32d8
pkgrel=1
pkgdesc="GIT utilities -- repo summary, commit counting, repl, changelog population and more"
arch=(any)
url="http://github.com/visionmedia/git-extras"
license=('custom:MIT')
depends=('git' 'bash')
source=(git-extras-$pkgver.tar.gz::https://github.com/visionmedia/${pkgname}/tarball/${_pkgtag})
md5sums=('e7034197d57f31e9c5d6a081587ec9e1')
sha256sums=('9061144559c4293f1b4a6eabe625e43f119cb17665382388634f210a304e822d')

package() {
  cd "$srcdir/visionmedia-$pkgname-$_pkgtag"

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
