# Maintainer: Gunnar Bretthauer <taijian@posteo.de>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Anty0 <anty150 at gmail dot com>

_name='facerecognition'
pkgname=('nextcloud-app-facerecognition')
pkgver=0.9.40
pkgrel=1
pkgdesc='Nextcloud app that implement a basic facial recognition system'
arch=('any')
url="https://github.com/matiasdelellis/facerecognition"
license=('AGPL3')
makedepends=('yq')
depends=('nextcloud' 'php-legacy-pdlib')
options=('!strip')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
       $pkgname.timer
       $pkgname.service)
sha512sums=('0db492b876e694864faf0cda15ce1f7d1320827a9c35916cc502d6eb8dcfeba555ee5e240ae2351f1f1ce87a09a573a83f95e0c0dd3db2d264029ad9e437b6e1'
            '4cfd3bcbbfe9a5fac0c589ac7878279b381054e89bd66f54f4b7c4b4be4c9715e265362231019b2a93d96d1b497308719e91f3a24949ed4dd598cbfbc778aa0f'
            '8564a3096090a0dffe7c66da5eed84da1e58a31176be90b3b47b2d7e09835fabb5a896847e54deff51479cc40d8c70fe8f694cc8a09fd5803baad9c70a2e07e9')

package() {
  install -vdm 755 "$pkgdir/usr/share/webapps/nextcloud/apps/"
  cp -av $_name "$pkgdir/usr/share/webapps/nextcloud/apps/"
  # systemd service
  install -vDm 644 $pkgname.service -t "$pkgdir/usr/lib/systemd/system/"
  install -vDm 644 $pkgname.timer -t "$pkgdir/usr/lib/systemd/system/"  
}
