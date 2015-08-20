# Maintainer: Elovsky Valentin (evvsoft@gmail.com)
# Contributor: Shalygin Konstantin (kostya@opentech.ru)

pkgname='ivideon-server'
pkgver='3.5.4'
pkgrel='653'
_rel='e30023a6ebf9'
pkgdesc='Ivideon Server (with QT5 GUI)'
arch=('x86_64')
url=('https://ivideon.com/')
license=('freeware')
depends=('ivideon-server-headless' 'qt5-base' 'qt5-svg' 'qt5-script' 'libsndfile' 'libxcb' 'libsm' 'gksu')
conflicts=('ivideon-video-server-nogui' 'ivideon-video-server')
source=("https://packages.ivideon.com/ubuntu/pool/non-free/i/ivideon-video-server/ivideon-video-server_${pkgver}-${pkgrel}~${_rel}_amd64.deb")
sha256sums=("e9762d0eff59b0ea31175f2af4afaa51db6622c3941426557bc198885af81a26")

build() {
  cd "$srcdir"
  bsdtar xf "$srcdir/data.tar.gz"
}

package() {
  cp -dpr --no-preserve=ownership "$srcdir/opt" "$pkgdir"
  cp -dpr --no-preserve=ownership "$srcdir/usr" "$pkgdir"
}
