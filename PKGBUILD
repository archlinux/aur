# Maintainer: Maxim Andersson <thesilentboatman@gmail.com> 

pkgname=svtplay-dl-git
_gitname=svtplay-dl
pkgver=0.30.2016.01.10.r19.gd66a2a7
pkgrel=1
pkgdesc="Small command-line program to download videos from svtplay.se/tv4play.se/tv3play.se/tv8play.se/tv6play.se/aftonbladet"
arch=('any')
url="https://github.com/spaam/svtplay-dl"
license=('MIT')
depends=('rtmpdump' 'python-crypto' 'python-requests')
makedepends=('git' 'python-setuptools')
provides=('svtplay-dl')
conflicts=('svtplay-dl')
source=('git://github.com/spaam/svtplay-dl.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_gitname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "${srcdir}/${_gitname}"

  python setup.py install --root "${pkgdir}"
  install -Dm644 "${srcdir}/${_gitname}/LICENSE" -t "${pkgdir}}/usr/share/licenses/${_gitname}"
}

# vim:set ts=2 sw=2 et:
