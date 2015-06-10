# Maintainer: Elovsky Valentin (evvsoft@gmail.com)
# Contributor: Shalygin Konstantin (kostya@opentech.ru)

pkgname='ivideon-server'
pkgver='3.5.3'
pkgrel='541'
_rel='db1d2755b7af'
pkgdesc='Ivideon Server (with QT5 GUI)'
arch=('x86_64')
url=('https://ivideon.com/')
license=('freeware')
depends=('ivideon-server-headless' 'qt5-base' 'qt5-svg' 'qt5-script' 'libsndfile' 'libxcb' 'libsm' 'gksu')
conflicts=('ivideon-video-server-nogui' 'ivideon-video-server')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/ivideon-video-server/ivideon-video-server_${pkgver}-${pkgrel}~${_rel}_amd64.deb")
sha256sums=("ea49463225f17eaa541bf524ea3986762533adc89bed6b672afdc0d7436db57c")

build() {
  cd "$srcdir"
  bsdtar xf "$srcdir/data.tar.gz"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/opt" "$pkgdir"
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
}
