# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# See http://wiki.archlinux.org/index.php/Python_Package_Guidelines for more
# information on Python packaging.

# Maintainer: Your Name <youremail@domain.com>
pkgname=python2-usbrevue
pkgver=0.1.0
pkgrel=1
pkgdesc="USB Reverse-Engineering Toolkit"
arch=(i686 x86_64)
url="https://bitbucket.org/TeamC2011/usbrevue/"
license=('unknown')
groups=()
depends=('python2' 'scapy' 'python2-pcapy' 'python2-gflags')
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)
install=
source=('https://github.com/fdev31/usbrevue/archive/fb01f124513c5e49ff0f8b77939c6dcf39e7b90c.zip')
md5sums=('6557d2095ca8348b601bfb4f9fe4eeb3')

package() {
  cd "$srcdir/usbrevue-"*
  sed -i "s/env python/env python2/g" *.py
  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
