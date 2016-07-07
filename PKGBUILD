pkgname=archvyrt
pkgver=0.3.5
pkgrel=1
pkgdesc="libvirt provisioner for archlinux libvirt hosts"
url="https://github.com/andrekeller/archvyrt"
depends=('python' 'python-setuptools' 'libvirt-python3' 'gptfdisk' 'arch-install-scripts' 'debootstrap')
makedepends=('python-setuptools' )
license=('MIT')
arch=('any')
source=("https://pypi.python.org/packages/source/a/archvyrt/archvyrt-$pkgver.tar.gz")
md5sums=('e0acd7ff8a90c5d211797859d59c4a9b')

build() {
    cd $srcdir/archvyrt-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/archvyrt-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
