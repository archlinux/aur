# Maintainer: Ben Westover <kwestover.kw@gmail.com>

pkgname='nuxhash-git'
pkgver=v1.0.0b2.r33.g33e9a09
pkgrel=5
pkgdesc="A NiceHash cryptocurrency mining client for Linux."
arch=('x86_64')
url="https://github.com/YoRyan/nuxhash"
license=('GPL3')
depends=('python' 'python-requests' 'curl' 'nvidia' 'opencl-nvidia' 'cuda')
makedepends=('python-setuptools')
source=("git+https://github.com/YoRyan/nuxhash.git")
sha256sums=('SKIP')
install=nuxhash-git.install

pkgver() {
	cd nuxhash
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
	cd nuxhash
	python setup.py install --optimize=1 --root "$pkgdir"
}
