# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ivideon-server'
pkgver='3.10.0'
pkgrel='6305'
_rel='ae01ccb'
pkgdesc='Ivideon Server (with QT5 GUI)'
arch=('x86_64')
url='https://ivideon.com'
license=('freeware')
depends=('ivideon-server-headless' 'qt5-base' 'qt5-multimedia' 'libsndfile' 'libxcb' 'libsm')
conflicts=('ivideon-video-server-nogui' 'ivideon-video-server')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/ivideon-video-server/ivideon-video-server_${pkgver}-${pkgrel}~${_rel}_amd64.deb")
md5sums=('da7b6f78e07a69bf047b362c5ae4d5c6')

build() {
  cd "$srcdir"
  bsdtar xf "${srcdir}/data.tar.xz"
}

package() {
  cp -ax "${srcdir}/opt" "$pkgdir"
  cp -ax "${srcdir}/usr" "$pkgdir"
}
