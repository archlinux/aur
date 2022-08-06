# Maintainer: Vladimir Sandomirskii <complover116 at gmail dot com>
pkgname=zfs_autobackup
pkgver=3.1.3
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
sha256sums=('05f18e8d920a1521c3a260dea433821dcf0ccd62d6497337c960f3608a53d482')

build() {
	cd $pkgname-$pkgver
    python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1
}
