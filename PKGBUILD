# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Anty0 <anty150 at gmail dot com>

_name='facerecognition'
pkgname=('nextcloud-app-facerecognition')
pkgver=0.9.30
pkgrel=2
pkgdesc='Nextcloud app that implement a basic facial recognition system'
arch=('any')
url="https://github.com/matiasdelellis/facerecognition"
license=('AGPL3')
makedepends=('yq')
depends=('nextcloud' 'php-legacy-pdlib')
options=('!strip')
source=("${_name}-v${pkgver}.tar.gz::${url}/releases/download/v${pkgver/_/-}/${_name}.tar.gz"
       $pkgname.timer
       $pkgname.service)
sha512sums=('0b86cc7203c997fd1d305a6a134000e524311937ea145fe8f3fa4aec56859cb38c9c389970c9e113e30341d5747c660cd40b51817f2329967f705f3d6dd38da2'
            '4cfd3bcbbfe9a5fac0c589ac7878279b381054e89bd66f54f4b7c4b4be4c9715e265362231019b2a93d96d1b497308719e91f3a24949ed4dd598cbfbc778aa0f'
            '8564a3096090a0dffe7c66da5eed84da1e58a31176be90b3b47b2d7e09835fabb5a896847e54deff51479cc40d8c70fe8f694cc8a09fd5803baad9c70a2e07e9')

package() {
  install -vdm 755 "$pkgdir/usr/share/webapps/nextcloud/apps/"
  cp -av $_name "$pkgdir/usr/share/webapps/nextcloud/apps/"
  # systemd service
  install -vDm 644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 $pkgname.timer -t "$pkgdir/usr/lib/systemd/system/"  
}
