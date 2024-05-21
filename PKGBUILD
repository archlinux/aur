# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=virtme-ng
pkgver=1.25
pkgrel=1
pkgdesc="A tool that allows to easily and quickly recompile and test a Linux kernel, starting from the source code."
arch=('any')
url="https://github.com/arighi/virtme-ng"
license=('GPL-2.0-only')
depends=('bash' 'python>=3.8' 'python-argcomplete' 'python-importlib-metadata' 'python-requests' 'python-setuptools' 'qemu>=1.6')
optdepends=('busybox: for inclusion of busybox')
conflicts=('virtme-git' 'virtme-ng-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arighi/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('5b061b30cffa966199bcba5a7661f2bf5254939ba41309fc4e63e46cea2215cc132537279170a76a7099ab6c8231d90a1d82178695376a0295e7ed351aa4a418')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
