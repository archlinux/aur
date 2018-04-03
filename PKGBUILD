# Maintainer: Fenner Macrae <fmacrae.dev at gmail dot com>

_pkgname=i3-swallow
pkgname=$_pkgname-git
pkgver=r10.09d16e7
pkgrel=1
pkgdesc="Swallow a terminal window after a blocking application is run in i3"
arch=('any')
url="https://github.com/jamesofarrell/i3-swallow"
license=('MIT')
depends=('i3-wm' 'i3ipc-python-git')
makedepends=('git')
conflicts=('i3-swallow')
changelog=
source=("${_pkgname}::git+${url}.git")
md5sums=('SKIP')

pkgver()
{
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/${_pkgname}"
  install -Dm 755 i3-swallow "$pkgdir/usr/bin/i3-swallow"
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
