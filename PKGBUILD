# Maintainer: Ivan Shapovalov <intelfx@intelfx.name>
# Contributor: Timofey Titovets <nefelim4ag@gmail.com>

pkgname=python-btrfs-git
pkgver=11.r19.gbe20b2f
pkgrel=1
pkgdesc="Python Btrfs module"
arch=('any')
url="https://github.com/knorrie/python-btrfs"
license=('LGPL3')
depends=('python')
makedepends=('git')
provides=('python-btrfs')
conflicts=('python-btrfs')
source=("git+https://github.com/knorrie/python-btrfs.git#branch=develop")
sha256sums=('SKIP')

pkgver() {
    cd python-btrfs
    git describe --long --tags | sed -r 's|^v||;s|-|.r|;s|-|.|g'
}

build() {
    cd python-btrfs
    python setup.py build
}

package() {
    cd python-btrfs
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1
}
