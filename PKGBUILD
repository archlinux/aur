# Maintainer: Chris Höppner <me@mkaito.com>
pkgname=dasht
pkgver=2.1.0
pkgrel=1
pkgdesc="API documentation in your terminal"
arch=(any)
url="https://github.com/sunaku/dasht"
license=('ISC')
depends=('bash' 'sqlite' 'wget' 'socat' 'w3m')
makedepends=('git')
conflicts=('dasht-git')
source=("https://github.com/sunaku/dasht/archive/v$pkgver.tar.gz")
sha1sums=('774841c0878d639444b65a2d920b92978ef63a4b')

# pkgver() {
#     cd "$srcdir/$_pkgname"
#     git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
# }

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/dasht-git/LICENSE
  cd "$srcdir/$pkgname-$pkgver/bin"
  install -Dm755 -t $pkgdir/usr/bin *
  cd "$srcdir/$pkgname-$pkgver/man/man1"
  install -Dm755 -t $pkgdir/usr/share/man/man1 *
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# sh-indentation: 2
# End:
