# Maintainer: Yigit Sever <yigit at yigitsever dot com>
# Contributor: Fenner Macrae <fmacrae.dev at gmail dot com>

_pkgname=i3-swallow
pkgname=$_pkgname-git
pkgver=r66.7a9faed
pkgrel=1
pkgdesc="Swallow a terminal window after a blocking application is run in i3"
arch=('any')
url="https://github.com/jamesofarrell/i3-swallow"
license=('MIT')
depends=('i3-wm' 'python-i3ipc')
makedepends=('git')
conflicts=('i3-swallow')
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver()
{
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm 755 swallow.py "${pkgdir}"/usr/bin/swallow
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
