# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>
# Contributor: Shimi Chen <shimi.chen@gmail.com>
# Contributor: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Contributor: LookTJ/Taylor Lookabaugh <jesus.christ.i.love@gmail.com>
# Contributor: alessandro_ufms
# Contributer: Bluthund <bluthund23@gmail.com>

pkgname=caffeine-systray
pkgver=2.5
pkgrel=1
# epoch was already set to 1 when I adopted it.
epoch=1
pkgdesc="Fork of caffeine that maintains systray support."
arch=(any)
url=https://gitlab.com/hobarrera/caffeine-ng/
license=(GPL3)
depends=(dconf gtk2 hicolor-icon-theme kaa-metadata python2-dbus
         python2-gobject python2-notify python2-xdg python2-xlib)
conflicts=(caffeine caffeine-bzr caffeine-oneclick)
provides=(caffeine caffeine-bzr caffeine-oneclick)
replaces=(caffeine-oneclick)
makedepends=(git)
options=(!emptydirs !libtool)
install=$pkgname.install
source=(https://gitlab.com/hobarrera/caffeine-ng/repository/archive.tar.gz?ref=v2.5)
sha256sums=('73d2775e1f232594cea7978a4b6b5bead5e7549b2081c7db1fdd0b3a724bdc1f')

prepare() {
    cd "$srcdir/caffeine-ng-v2.5-26c15ff68e4a6996d8da18229f15760ef42e2e05"
    find -name '*.py' -type f -exec sed -ri 's:^#!/usr/bin/(env )?python$:&2:' '{}' \;
}

package() {
    cd "$srcdir/caffeine-ng-v2.5-26c15ff68e4a6996d8da18229f15760ef42e2e05"
    python2 setup.py install --root="$pkgdir"
}
