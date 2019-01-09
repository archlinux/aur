pkgname=archvyrt
pkgver=0.6.1
pkgrel=1
pkgdesc="libvirt provisioner for archlinux libvirt hosts"
url="https://github.com/andrekeller/archvyrt"
depends=('python' 'python-setuptools' 'libvirt-python' 'gptfdisk' 'arch-install-scripts' 'debootstrap')
makedepends=('python-setuptools' )
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/a/archvyrt/archvyrt-$pkgver.tar.gz")
sha256sums=('3b7fcca2244c6db3ebb91be5932c9e861be0d84615f1aef1408a3745c1fc8b12')

build() {
    cd $srcdir/archvyrt-$pkgver
    python setup.py build
}

package() {
    cd $srcdir/archvyrt-$pkgver
    python setup.py install --root="$pkgdir" --optimize=1 
}
