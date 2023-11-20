# Maintainer: Vladimir Sandomirskii <complover116 at gmail dot com>
pkgname=zfs_autobackup
pkgver=3.2.2
pkgrel=1
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
sha256sums=('736019c61a7829c3f60124e9213e51099cffad5a2d10826e3008c8f3b788b88e')

build() {
	cd $pkgname-$pkgver
    python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
