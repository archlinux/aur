# Maintainer: Nicolas F. <aur@fratti.ch>
pkgname=virtme-git
pkgver=v0.0.1.r29.g2cf2cd6
pkgrel=1
pkgdesc="A set of simple tools to run a virtualised Linux kernel"
arch=('any')
url="https://git.kernel.org/cgit/utils/kernel/virtme/virtme.git"
license=('GPL')
depends=('python' 'qemu')
optdepends=('busybox: for inclusion of busybox')
options=(!emptydirs)
source=('git+https://git.kernel.org/pub/scm/utils/kernel/virtme/virtme.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/virtme"
  git describe | sed -r 's/virtme-//; s/([^-]*-g)/r\1/; s/-/./g'
}

package() {
  cd "$srcdir/virtme"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
