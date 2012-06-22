# Maintainer: Thomas Jost <schnouki+aur@schnouki.net>
pkgname=git-extras
pkgver=1.7.0
pkgrel=1
pkgdesc="GIT utilities -- repo summary, commit counting, repl, changelog population and more"
arch=(any)
url="http://github.com/visionmedia/git-extras"
license=('custom:MIT')
depends=('git' 'bash')
source=(git-extras-${pkgver}.tar.gz::https://github.com/visionmedia/${pkgname}/tarball/${pkgver})
md5sums=('f0bdcecbc4d403937d175b2ebeb6df53')
sha256sums=('270e941af5a437c98e96dab0bd86e1dfa908a14dcd769536dadebe9584240b85')

package() {
  cd "$srcdir"/visionmedia-"$pkgname"-*

  make DESTDIR="$pkgdir" PREFIX="/usr" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
