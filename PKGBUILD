# Maintainer: Manuel Wiesinger <m at mmap dot at>
pkgname=virtme-ng-git
_srcname=virtme-ng
pkgver=v1.22.r0.gba33d94
pkgrel=2
pkgdesc="A tool that allows to easily and quickly recompile and test a Linux kernel, starting from the source code."
arch=('any')
url="https://github.com/arighi/virtme-ng"
license=('GPL-2.0-only')
makedepends=('git')
depends=('bash' 'python>=3.8' 'python-argcomplete' 'python-importlib-metadata' 'python-requests' 'python-setuptools' 'qemu>=1.6')
optdepends=('busybox: for inclusion of busybox')
conflicts=('virtme-git')
source=("git+${url}.git")
b2sums=('SKIP')

pkgver() {
    cd "$srcdir/${_srcname}"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/$_srcname"
    python setup.py install --root="$pkgdir/" --optimize=1
}
