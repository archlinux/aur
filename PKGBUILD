# Maintainer: Bjoern Franke  <bjo@nord-west.org>

_pkgname=mopidy-deezer
pkgname=${_pkgname}-git
pkgver=r26.0c7f543
pkgrel=1
pkgdesc="Mopidy extension for playing music from Deezer"
arch=('any')
url="https://github.com/rusty-dev/mopidy-deezer"
license=('APACHE')
depends=('mopidy' 'python2-requests' 'python2-eyed3' 'python2-crypto' 'python2-pykka' 'python2-simplejson')
makedepends=('python2' 'python2-setuptools')

source=("${_pkgname}::git+https://github.com/rusty-dev/mopidy-deezer.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "${srcdir}/${_pkgname}"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
