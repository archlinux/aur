# Maintainer: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Arvedui <arvedui@posteo.de>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Joost Bremmer <toost.b@gmail.com>

pkgname=python-discogs-client
pkgver=2.3.0
pkgrel=1
pkgdesc="This is the official Discogs API client for Python. You can use it to query the Discogs music database for metadata on artists, releases, and more."
depends=('python-six' 'python-requests' 'python-oauthlib')
makedepends=('python-setuptools')
arch=('any')
# PyPI doesn't ship a license so we have to get it from GitHub
source=(discogs-client-$pkgver.tar.gz::https://files.pythonhosted.org/packages/f1/25/466ceb79d1da1f064765eceab842dbd35a1b7fb2e8f6be75d977bc0dda67/${pkgname#python-}-${pkgver}.tar.gz
        LICENSE::https://raw.githubusercontent.com/discogs/discogs_client/master/LICENSE)
md5sums=('b055618816d8bcf09c1409a30a29c3a4'
         'c1e6695335325feb11337315fb930f21')
url="https://github.com/discogs/discogs_client"
license=('custom')

package() {
  cd $srcdir/${pkgname#python-}-$pkgver
  python setup.py install --root=$pkgdir --optimize=1

  cd $srcdir
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim: set ts=2 sw=2 et:
