# Maintainer: Thomas Jost <schnouki+aur@schnouki.net>
pkgname=git-extras
pkgver=1.6.0
pkgrel=1
pkgdesc="GIT utilities -- repo summary, commit counting, repl, changelog population and more"
arch=(any)
url="http://github.com/visionmedia/git-extras"
license=('custom:MIT')
depends=('git' 'bash')
source=(git-extras-${pkgver}.tar.gz::https://github.com/visionmedia/${pkgname}/tarball/${pkgver})
md5sums=('7f8e253b4d948e21c877a2f15dd00581')
sha256sums=('b4a1faba328128b2cb04695f10f44728e22e35e0dd2ae43c620944d44f3e0a1e')

package() {
  cd "$srcdir"/visionmedia-"$pkgname"-*

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
