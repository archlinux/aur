# Maintainer: Guillaume Hayot <ghayot@postblue.info>
# Contributor: Arvedui <arvedui@posteo.de>
# Contributor: Marc Plano-Lesay <marc.planolesay@gmail.com>
# Contributor: Joost Bremmer <toost.b@gmail.com>

pkgname=python-discogs-client
pkgver=2.2.2
pkgrel=1
pkgdesc="This is the official Discogs API client for Python. You can use it to query the Discogs music database for metadata on artists, releases, and more."
depends=('python-six' 'python-requests' 'python-oauthlib')
makedepends=('python-setuptools')
arch=('any')
# PyPI doesn't ship a license so we have to get it from GitHub
source=(discogs-client-$pkgver.tar.gz::https://files.pythonhosted.org/packages/80/73/4f2e9180b9b2d2033d11c343f4d475452bed2512174c8691289e42d4720c/${pkgname#python-}-${pkgver}.tar.gz
        LICENSE::https://raw.githubusercontent.com/discogs/discogs_client/master/LICENSE)
md5sums=('4603ded67bb3e191269d7d00a919c3a7'
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
