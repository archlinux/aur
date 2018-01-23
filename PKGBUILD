pkgname=archvyrt
pkgver=0.5.1
pkgrel=1
pkgdesc="libvirt provisioner for archlinux libvirt hosts"
url="https://github.com/andrekeller/archvyrt"
depends=('python' 'python-setuptools' 'libvirt-python' 'gptfdisk' 'arch-install-scripts' 'debootstrap')
makedepends=('python-setuptools' )
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/archvyrt/archvyrt-$pkgver.tar.gz")
md5sums=('a19f80a2df28c330fa44a170d2039e09')

build() {
    cd $srcdir/archvyrt-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/archvyrt-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
