# Maintainer: sseneca <me@ssene.ca>
pkgname=mopidy-jellyfin
pkgver=1.0.0
pkgrel=1
pkgdesc="Mopidy extension for playing music from jellyfin"
arch=('any')
url="https://github.com/jellyfin/mopidy-jellyfin"
license=('Apache')
depends=('python'
         'python-setuptools'
         'mopidy>=3.0'
         'python-pykka'
         'python-requests'
         'python-unidecode'
         'python-websocket-client')
replaces=('python-mopidy-jellyfin')
source=("${url}/archive/v${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('772206dc0e97342ed5444068ea40219d8d2f144572a5e64a9772bc5c36ae6e800c9cb232e839133a2d1e17cb7a81dca5057f49fcaf8e7d242ce5b57476b09543')

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}
