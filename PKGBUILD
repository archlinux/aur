# Maintainer: TheCynicalTeam <TheCynicalTeam@github.com>
# Contributor: TheCynicalTeam <TheCynicalTeam@github.com>
pkgname=i3-swallow
pkgver=r10.09d16e7
pkgrel=1
pkgdesc="Swallow a terminal window after a blocking application is run in i3"
arch=('any')
url="https://github.com/TheCynicalTeam/i3-swallow"
license=('GNU General Public License v3.0')
depends=('i3-wm' 'python-i3ipc')
makedepends=('git')
conflicts=('i3-swallow-git')
changelog=
source=("git+${url}.git")
md5sums=('SKIP')

pkgver()
{
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm 755 swallow "$pkgdir/usr/bin/i3-swallow"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
