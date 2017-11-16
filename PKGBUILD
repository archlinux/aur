#Maintainer: Klearchos-Angelos Gkountras <jemadux at cryptolab dot net>
pkgname=curseradio-git
_pkgname=curseradio
pkgver=r15.1bd4bd0
pkgrel=1
pkgdesc="Command line radio player"
arch=('any')
url="https://github.com/chronitis/curseradio"
license=('MIT')
depends=('python' 'python-requests' 'python-xdg' 'python-lxml')
makedepends=('git')
provides=('curseradio-git')
options=(!emptydirs)
source=("git+https://github.com/chronitis/curseradio.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
}

# vim:set ts=2 sw=2 et:
