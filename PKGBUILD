# Contributor: Johannes Dewender arch at JonnyJD dot net
# Contributor: Eduardo Robles Elvira <edulix AT gmail DOT com>
# Contributor: Jon Nordby <jononor@gmail.com>
pkgname=obs-build-git
pkgver=2.5.0_325.g402588e
pkgrel=1
pkgdesc="Building part of the OpenSUSE Build Service, osc-build - git version"
url="http://build.opensuse.org"
arch=(any)
license=("GPL")
depends=(bash perl rpm-org xz)
makedepends=(git)
provides=(obs-build)
conflicts=(obs-build)
source=('git+https://github.com/openSUSE/obs-build.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/obs-build"
  git describe --tags | sed -e 's/obs_//g' -e 's/-/_/' -e 's/-/./g' -e 's/$v//g'
}

package() {
  cd "$srcdir/obs-build"
  make install DESTDIR="$pkgdir"
}
