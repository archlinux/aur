# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3session
pkgver=2020.11.1
pkgrel=2
pkgdesc="Remembers what's running in your i3 workspaces by saving a session file"
arch=('any')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('GNU General Public License v3.0')
depends=(python2-xdg perl-anyevent-i3 python-i3-py i3-wm xorg-xprop)
makedepends=('git')
source=("https://github.com/TheCynicalTeam/$pkgname/archive/$pkgver-$pkgrel.tar.gz")
sha256sums=('b7cdfabd319d87b0474e68d67f1c696cb0ffa65cfe39271fbb1467b460de7aa2')

package() {
  cd "$srcdir/$pkgname-$pkgver-$pkgrel"
  sed -i '1 s:/python:/env python3:' "$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
