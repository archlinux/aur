# Maintainer: Sirat18 <aur@sirat18.de>
# Contributor: Frédérik Paradis <fredy14[at]gmail[dot]com>

_gitname=inception
pkgname=inception-git
pkgver=0.4.1.r3.g34f207d
pkgrel=1
pkgdesc="A FireWire physical memory manipulation and hacking tool exploiting IEEE 1394 SBP-2 DMA."
url="http://www.breaknenter.org/projects/inception/"
arch=('any')
license=('GPL3')
depends=('python' 'libforensic1394')
optdepends=()
makedepends=('cmake' 'gcc' 'git')
provides=("inception")
conflicts=("inception")
source=("$_gitname"::'git+https://github.com/carmaa/inception.git')
sha512sums=('SKIP')

_gitroot="https://github.com/carmaa/${_gitname}.git"

pkgver() {
  cd "$startdir/$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
