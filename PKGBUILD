
pkgname=tribler
pkgver=6.5.0rc6
_pkgver=6.5.0-rc6
pkgrel=1
pkgdesc="Privacy with BitTorrent and resilient to shut down"
url="http://www.tribler.org/"
arch=(any)
license=('LGPL')
depends=('python-cryptography' 'python-feedparser' 'python-gmpy2' 'python-apsw' 'python-cherrypy' 'python-plyvel'
'python-decorator' 'python-netifaces' 'python-requests' 'python-twisted' 'wxpython' 'libsodium' 'libtorrent-rasterbar')
optdepends=('python-vlc-git: for internal video player')
makedepends=()
source=("https://github.com/Tribler/tribler/releases/download/v${_pkgver}/Tribler-v${_pkgver}.tar.xz")
md5sums=('3f57a3581a80af9d0b95d582aab472b5')

package() {
  cd "${srcdir}/tribler"
  install -d "${pkgdir}"/usr/{bin,share/tribler}
  install -m755 debian/bin/tribler "${pkgdir}"/usr/bin
  cp -r Tribler "${pkgdir}"/usr/share/tribler
}

