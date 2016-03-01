# Maintainer: Chris Höppner <me@mkaito.com>
_pkgname=dasht
pkgname=$_pkgname-git
pkgver=1.1.0.r1.g02e96d7
pkgrel=1
pkgdesc="API documentation in your terminal"
arch=(any)
url="https://github.com/sunaku/dasht"
license=('ISC')
depends=('bash' 'sqlite' 'wget' 'socat' 'w3m')
makedepends=('git')
conflicts=('dasht')
source=('git+https://github.com/sunaku/dasht.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$srcdir/$_pkgname"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/dasht-git/LICENSE
  cd "$srcdir/$_pkgname/bin"
  install -Dm755 -t $pkgdir/usr/bin *
  cd "$srcdir/$_pkgname/man/man1"
  install -Dm755 -t $pkgdir/usr/share/man/man1 *
}

# Local Variables:
# mode: shell-script
# sh-basic-offset: 2
# sh-indentation: 2
# End:
