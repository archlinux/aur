# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=virtme-ng
pkgver=1.22
pkgrel=1
pkgdesc="A tool that allows to easily and quickly recompile and test a Linux kernel, starting from the source code."
arch=('any')
url="https://github.com/arighi/virtme-ng"
license=('GPL-2.0-only')
depends=('bash' 'python>=3.8' 'python-argcomplete' 'python-importlib-metadata' 'python-requests' 'python-setuptools' 'qemu>=1.6')
optdepends=('busybox: for inclusion of busybox')
conflicts=('virtme-git' 'virtme-ng-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arighi/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d9eb8279c649210447bce0282c5f9f2d85cabb5790ff9332cd9e0ff3ae40b101287b11da6cd6283c44f062b983646e951ae7525ae8341cb74a9eeaa25979832a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
