# Maintainer: Petr Manek <pm+aur at petrmanek dot cz>

pkgname=mini-git
_pkgname=mini
pkgver=0.9.16.r0.gea85311
pkgrel=1
pkgdesc="Tiny, header only C++ library for manipulating INI files."
arch=(any)
license=(MIT)
makedepends=(git)
depends=()
provides=(mini)
source=("git+https://github.com/pulzed/mINI.git")
url="https://github.com/pulzed/mINI"
md5sums=(SKIP)

pkgver() {
  # from https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  cd mINI &&
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  # instructions from https://github.com/pulzed/mINI#installation
  cd mINI &&
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE" &&
  install -D -m644 src/mini/ini.h "$pkgdir/usr/include/mini/ini.h"
}


