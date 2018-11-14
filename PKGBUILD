# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

pkgname=iconoscope-git
pkgver=0.9.3.r6.g03dada1
pkgrel=1
pkgdesc="Explore the system's icon theme database written in Vala designed for Pantheon Shell"
arch=(any)
url="https://github.com/santileortiz/Iconoscope"
license=(GPL3)
depends=(libgranite.so python)
makedepends=(git vala)
provides=(iconoscope)
conflicts=(iconoscope)
source=("iconoscope::git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname/-git/}
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname/-git/}
  ./pymk.py iconoscope
}

package() {
  cd ${pkgname/-git/}
  ./pymk.py install --install_completions --destdir ${pkgdir}/
}

