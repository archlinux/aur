# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-session
pkgver=2021.01.01
pkgrel=1
pkgdesc="Remembers what's running in your i3 workspaces by saving a session file"
arch=('any')
groups=('therepoclub')
url="https://github.com/TheCynicalTeam/$pkgname"
license=('CC BY-NC-SA 4.0')
depends=(python2-xdg perl-anyevent-i3 python-i3-py i3-wm xorg-xprop)
makedepends=('git')
source=("${pkgname}-$pkgver.tar.gz::${url}/archive/$pkgver.tar.gz")
sha256sums=('0b097e5010ef03e2e8e9ab119b01755f0dbb0406ae0ec0ff1c3136c71d7e497c')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i '1 s:/python:/env python3:' "$pkgname"
  install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
}
