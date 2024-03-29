# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

pkgname=virtme-ng
pkgver=1.23
pkgrel=1
pkgdesc="A tool that allows to easily and quickly recompile and test a Linux kernel, starting from the source code."
arch=('any')
url="https://github.com/arighi/virtme-ng"
license=('GPL-2.0-only')
depends=('bash' 'python>=3.8' 'python-argcomplete' 'python-importlib-metadata' 'python-requests' 'python-setuptools' 'qemu>=1.6')
optdepends=('busybox: for inclusion of busybox')
conflicts=('virtme-git' 'virtme-ng-git')
source=("$pkgname-$pkgver.tar.gz::https://github.com/arighi/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('d94275f88ecc97c3b101eb5a869af198e999c9d52267b934975b95ae63c62426739f555fd82bf36d048c7c4aaaf7d8b261232331007b6543daccb135cf1fc700')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1
}
