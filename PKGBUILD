# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=python2-discogs-client
pkgver=2.2.2
pkgrel=1
pkgdesc="This is the official Discogs API client for Python. You can use it to query the Discogs music database for metadata on artists, releases, and more."
depends=('python2' "python2-requests" "python2-oauthlib")
makedepends=('python2-setuptools')
arch=('any')
source=(discogs-client-$pkgver.tar.gz::https://github.com/discogs/discogs_client/archive/v$pkgver.tar.gz)
md5sums=('3e1677100f05635eb1f1ca5796a5a087')
url="https://github.com/discogs/discogs_client"
license=("custom:Discogs")

package() {
  cd $srcdir/discogs_client-$pkgver
  python2 setup.py install --root=$pkgdir --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

