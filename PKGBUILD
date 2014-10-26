# Maintainer: Arvedui <arvedui@posteo.de>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

python=python2
name=discogs-client

pkgname=$python-$name
pkgver=2.0.2
pkgrel=1
pkgdesc="This is the official Discogs API client for Python. You can use it to query the Discogs music database for metadata on artists, releases, and more."
depends=('python2' "$python-requests")
arch=('any')
source=(https://github.com/discogs/discogs_client/archive/v$pkgver.tar.gz)
md5sums=(78b98f1164494e37df7941a9437d4e29)
url="https://github.com/discogs/discogs_client"
license="custom:Discogs"

package() {
  cd $srcdir/discogs_client-$pkgver
  $python setup.py install --root=$pkgdir --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

