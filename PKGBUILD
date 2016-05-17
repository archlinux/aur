# Maintainer: Shalygin Konstantin <k0ste@cn.ru>

pkgname='ivideon-server'
pkgver='3.5.5'
pkgrel='1124'
_rel='1b8a0dd609df'
pkgdesc='Ivideon Server (with QT5 GUI)'
arch=('x86_64')
url='https://ivideon.com'
license=('freeware')
depends=('ivideon-server-headless' 'qt5-base' 'qt5-svg' 'qt5-script' 'libsndfile' 'libxcb' 'libsm' 'gksu')
conflicts=('ivideon-video-server-nogui' 'ivideon-video-server')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/ivideon-video-server/ivideon-video-server_${pkgver}-${pkgrel}~${_rel}_amd64.deb")
md5sums=('d7e005b97e87dce38a4524155a193b93')

build() {
  cd "$srcdir"
  bsdtar xf "${srcdir}/data.tar.gz"
}

package() {
  cp -ax "${srcdir}/opt" "$pkgdir"
  cp -ax "${srcdir}/usr" "$pkgdir"
}
