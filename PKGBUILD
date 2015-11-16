# Maintainer: Streetwalrus <streetwalrus@codewalr.us>
pkgname=da2013ctl-git
pkgver=20151116.8689635
pkgrel=1
pkgdesc="Alternative to razercfg for the DeathAdder 2013"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/Streetwalrus/da2013ctl"
license=('MIT')
depends=('libsystemd')
provides=('da2013ctl')
conflicts=('da2013ctl')
makedepends=('git')
source=('git+https://github.com/Streetwalrus/da2013ctl.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/da2013ctl"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

build() {
  cd "${srcdir}/da2013ctl"
  make
}

package() {
  cd "${srcdir}/da2013ctl"
  make install PREFIX="${pkgdir}/usr"
}

# vim:set ts=2 sw=2 et:
