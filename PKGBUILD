# Maintainer: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Arvedui <arvedui@posteo.de>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>

pkgname=python-discogs-client
pkgver=2.2.0
pkgrel=2
pkgdesc="This is the official Discogs API client for Python. You can use it to query the Discogs music database for metadata on artists, releases, and more."
depends=('python' "python-requests" "python-oauthlib")
makedepends=('python-setuptools')
arch=('any')
source=(discogs-client-$pkgver.tar.gz::https://github.com/discogs/discogs_client/archive/v$pkgver.tar.gz)
md5sums=('a30f35e514249a6eeadddd9c89bf9db9')
url="https://github.com/discogs/discogs_client"
license=("custom:Discogs")

package() {
  cd $srcdir/discogs_client-$pkgver
  python setup.py install --root=$pkgdir --optimize=1

  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
