# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ivideon-server'
pkgver='3.10.0'
pkgrel='6453'
_rel='27b464e'
pkgdesc='Ivideon Server (with QT5 GUI)'
arch=('x86_64')
url='https://ivideon.com'
license=('freeware')
depends=('ivideon-server-headless' 'qt5-base' 'qt5-multimedia' 'libsndfile' 'libxcb' 'libsm')
conflicts=('ivideon-video-server-nogui' 'ivideon-video-server')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/ivideon-video-server/ivideon-video-server_${pkgver}-${pkgrel}~${_rel}_amd64.deb")
md5sums=('c9a69e44f77422523f5d01e763a78267')

build() {
  cd "$srcdir"
  bsdtar xf "${srcdir}/data.tar.xz"
}

package() {
  cp -ax "${srcdir}/opt" "$pkgdir"
  cp -ax "${srcdir}/usr" "$pkgdir"
}
