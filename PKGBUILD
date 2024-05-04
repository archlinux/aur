# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=virtme-ng
pkgver=1.24
pkgrel=1
pkgdesc="A tool that allows to easily and quickly recompile and test a Linux kernel, starting from the source code."
arch=('any')
url="https://github.com/arighi/virtme-ng"
license=('GPL-2.0-only')
depends=('bash' 'python>=3.8' 'python-argcomplete' 'python-importlib-metadata' 'python-requests' 'python-setuptools' 'qemu>=1.6')
optdepends=('busybox: for inclusion of busybox')
conflicts=('virtme-git' 'virtme-ng-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arighi/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('ac73d547ae159faa0cc8f74e8798c3605d6624418572903b99e6d2cfa414a990c760463aa5f1b1f560dafaa343912eeeef828edc6a28e73b095bb28468308f2f')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
