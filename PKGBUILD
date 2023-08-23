# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Anty0 <anty150 at gmail dot com>

_name='facerecognition'
pkgname=('nextcloud-app-facerecognition')
pkgver=0.9.20
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
sha512sums=('76cebad4d0dfa51956b1b82899f8c5d5b678c983293ebd629a17f5e625853e794be121403ff705406adc5c14ef7fcfe4e9e078a8f2d9e13a1296f8ab611537cb'
            '4cfd3bcbbfe9a5fac0c589ac7878279b381054e89bd66f54f4b7c4b4be4c9715e265362231019b2a93d96d1b497308719e91f3a24949ed4dd598cbfbc778aa0f'
            '8564a3096090a0dffe7c66da5eed84da1e58a31176be90b3b47b2d7e09835fabb5a896847e54deff51479cc40d8c70fe8f694cc8a09fd5803baad9c70a2e07e9')

package() {
  install -vdm 755 "$pkgdir/usr/share/webapps/nextcloud/apps/"
  cp -av $_name "$pkgdir/usr/share/webapps/nextcloud/apps/"
  # systemd service
  install -vDm 644 ../$pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 ../$pkgname.timer -t "$pkgdir/usr/lib/systemd/system/"  
}
