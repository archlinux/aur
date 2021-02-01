#Maintainer: Angel Dimov <cyfraka at protonmail dot com>
pkgname=curseradio-git
_pkgname=curseradio
pkgver=1
pkgrel=1
pkgdesc="Command line radio player"
arch=('any')
url="https://github.com/Cyfraka/curseradio"
license=('MIT')
depends=('python' 'mpv' 'python-requests' 'python-xdg' 'python-lxml')
makedepends=('git')
provides=('curseradio-git')
options=(!emptydirs)
source=("git+https://github.com/cyfraka/curseradio.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
