# Maintainer: Shalygin Konstantin (k0ste@cn.ru)

pkgname='ivideon-server'
pkgver='3.5.4'
pkgrel='872'
_rel='6cdac9e54751'
pkgdesc='Ivideon Server (with QT5 GUI)'
arch=('x86_64')
url=('https://ivideon.com/')
license=('freeware')
depends=('ivideon-server-headless' 'qt5-base' 'qt5-svg' 'qt5-script' 'libsndfile' 'libxcb' 'libsm' 'gksu')
conflicts=('ivideon-video-server-nogui' 'ivideon-video-server')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/ivideon-video-server/ivideon-video-server_${pkgver}-${pkgrel}~${_rel}_amd64.deb")
md5sums=('d44bf90f8c7a34f75906f5fae1b267fe')

build() {
  cd "$srcdir"
  bsdtar xf "$srcdir/data.tar.gz"
}

package() {
  cp -ax "$srcdir/opt" "$pkgdir"
  cp -ax "$srcdir/usr" "$pkgdir"
}
