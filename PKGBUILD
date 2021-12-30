# Maintainer: Vladimir Sandomirskii <complover116 at gmail dot com>
pkgname=zfs_autobackup
pkgver=3.1.1
pkgrel=2
pkgdesc="Automatic ZFS backup tool"
arch=('any')
url="https://github.com/psy0rz/zfs_autobackup"
license=('GPL3')
groups=()
depends=("python" "zfs-utils" "python-colorama")
makedepends=("python-setuptools")
optdepends=("mbuffer: rate limiting and data send/recv buffer support")
provides=()
conflicts=()
replaces=()
backup=()
options=()
# install=
# changelog=
source=(https://github.com/psy0rz/$pkgname/archive/refs/tags/v$pkgver.tar.gz)
noextract=()
sha256sums=('50fb80a147d13aaf499a210f333895f088560ad973a06f87eb6944f863d3444d')

build() {
	cd $pkgname-$pkgver
    python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
