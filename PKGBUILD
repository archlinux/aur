# Maintainer: Sebastian Gumprich <aur at gumpri dot ch>
# Contributor: shimi <shimi.chen@gmail.com>
# Contributor: Gustavo Castro <gustawho at gmail dot com>
pkgname=indicator-kdeconnect-git
pkgver=r599.070ebaa
pkgrel=1
_gitname=indicator-kdeconnect
pkgdesc="Integrate KDEConnect on desktop environments that use AppIndicators (e.g. Unity)"
arch=('any')
url="https://github.com/bajoja/indicator-kdeconnect"
license=('GPL')
conflicts=('indicator-kdeconnect')
provides=('indicator-kdeconnect')
depends=('libappindicator-gtk3' 'kdeconnect' 'vala' 'python-requests-oauthlib' 'python-gobject' 'libgee')
makedepends=('git' 'meson' 'ninja')
source=('git://github.com/bajoja/indicator-kdeconnect.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd indicator-kdeconnect
  mkdir build
  cd build
  meson .. --prefix=/usr/  --libdir=/usr/lib/
  ninja
  ninja install
}
