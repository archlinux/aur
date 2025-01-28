# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=elden-proton-git
pkgver=r23.e53025d
pkgrel=1
pkgdesc="Noob friendly Elden Ring mod loader for linux/proton/steam (latest commit)"
url="https://github.com/Cloudef/elden-proton"
license=('custom')
arch=('any')
depends=('bash' 'zenity')
makedepends=('git')
provides=("elden-proton")
conflicts=("elden-proton")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd elden-proton
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -Dm755 elden-proton/elden-proton.bash "$pkgdir/usr/bin/elden-proton"
}
