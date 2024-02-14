# Maintainer: Manuel Wiesinger <m at mmap dot at>
pkgname=virtme-ng-git
pkgver=r806.c25de2f
pkgrel=1
pkgdesc="A tool that allows to easily and quickly recompile and test a Linux kernel, starting from the source code."
arch=('any')
url="https://github.com/arighi/virtme-ng"
license=('GPL2')
makedepends=('git')
depends=('python>=3.8' 'qemu>=1.6' 'python-setuptools' 'python-argcomplete' 'python-importlib-metadata' 'bash')
optdepends=('busybox: for inclusion of busybox')
conflicts=('virtme-git')
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
	 cd "$srcdir/${_srcname}"
	 printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/virtme-ng"
  python setup.py install --root="$pkgdir/" --optimize=1
}
