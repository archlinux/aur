# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>

pkgname=zget-git
_gitname=zget
pkgver=0.10.r0.g078de10
pkgrel=1
pkgdesc="Zeroconf based peer to peer file transfer"
arch=('any')
url="https://github.com/nils-werner/zget"
license=('MIT')
depends=('python' 'python-netifaces' 'python-progressbar2' 'python-requests' 'python-zeroconf')
makedepends=('git')
provides=('zget')
conflicts=('zget')
source=('git://github.com/nils-werner/zget.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"

  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_gitname}"
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
}

# vim:set ts=2 sw=2 et:
