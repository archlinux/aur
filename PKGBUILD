# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='nuxhash-git'
pkgver=v1.0.0b2.r33.g33e9a09
pkgrel=1
pkgdesc="A NiceHash cryptocurrency mining client for Linux."
arch=('x86_64' 'i686')
url="https://github.com/YoRyan/nuxhash"
license=('GPL3')
depends=('python' 'curl' 'nvidia' 'opencl-nvidia')
makedepends=('python-pip')
optdepends=('python-wxpython: GUI support')
source=("git+https://github.com/YoRyan/nuxhash.git")
sha256sums=('SKIP')

pkgver() {
	cd nuxhash
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	pip install ./nuxhash --root "$pkgdir" --no-warn-script-location
}
