# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: José Luis Lafuente <jl@lafuente.me>

pkgname=pass-sshaskpass-git
pkgver=18.698346b
pkgrel=2
pkgdesc='Get ssh passphrase from pass'
url='https://github.com/jlesquembre/pass-sshaskpass'
license=('GPL2')
arch=('any')
depends=('pass' 'zenity')
makedepends=('git')
provides=('pass-sshaskpass')
conflicts=('pass-sshaskpass')
source=("git+https://github.com/jlesquembre/${pkgname%-git}.git")
b2sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

package() {
  cd ${pkgname%-git}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/etc
}
