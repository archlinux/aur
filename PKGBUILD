pkgname=archvyrt
pkgver=0.6.0
pkgrel=1
pkgdesc="libvirt provisioner for archlinux libvirt hosts"
url="https://github.com/andrekeller/archvyrt"
depends=('python' 'python-setuptools' 'libvirt-python' 'gptfdisk' 'arch-install-scripts' 'debootstrap')
makedepends=('python-setuptools' )
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/archvyrt/archvyrt-$pkgver.tar.gz")
sha256sums=('5709c3f7e83e081045d4f9f17bb764a7810bb06e492315249f1c2042750982fc')

build() {
    cd $srcdir/archvyrt-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/archvyrt-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
