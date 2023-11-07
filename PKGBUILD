pkgname=vmtouch-systemd-git
pkgver=r6.196c4c7
pkgrel=2
pkgdesc='Systemd support for vmtouch.'
arch=('any')
url='https://github.com/dracorp/vmtouch-systemd'
license=('GPL')
depends=(libui-sh vmtouch)
makedepends=(git)
provides=(vmtouch-systemd)
conflicts=(vmtouch-systemd)
backup=(
etc/vmtouch.conf
etc/default/vmtouch
)
source=("git+$url.git")
sha256sums=('SKIP')
_gitname='vmtouch-systemd'
pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}
package() {
  cd "$srcdir"/$_gitname
  make DESTDIR="$pkgdir" install
}
