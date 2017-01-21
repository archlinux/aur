# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='ivideon-server'
pkgver='3.5.7'
pkgrel='1698'
_rel='34e00393fac6'
pkgdesc='Ivideon Server (with QT5 GUI)'
arch=('x86_64')
url='https://ivideon.com'
license=('freeware')
depends=('ivideon-server-headless' 'qt5-base' 'qt5-svg' 'qt5-script' 'libsndfile' 'libxcb' 'libsm' 'gksu')
conflicts=('ivideon-video-server-nogui' 'ivideon-video-server')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/ivideon-video-server/ivideon-video-server_${pkgver}-${pkgrel}~${_rel}_amd64.deb")
md5sums=('67f1ab3eab01a270875b568ca0840a14')

build() {
  cd "$srcdir"
  bsdtar xf "${srcdir}/data.tar.gz"
}

package() {
  cp -ax "${srcdir}/opt" "$pkgdir"
  cp -ax "${srcdir}/usr" "$pkgdir"
}
