# Contributor: Justin R. St-Amant <jstamant24 at gmail dot com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
pkgname=googlecl
pkgver=0.9.15
pkgrel=2
pkgdesc="Command line utility to use google services"
arch=('any')
url="https://github.com/vinitkumar/googlecl"
license=('APACHE')
depends=('python2' 'python2-gdata' 'python2-httplib2' 'python2-oauth2client')
source=(${pkgname}-${pkgver}.tar.gz::https://github.com/vinitkumar/${pkgname}/archive/v${pkgver}.tar.gz)
md5sums=('76c96871c69ec1272b31e808cb0a3cac')

package() {
  cd "$pkgname-$pkgver"
  python2 setup.py install --prefix=/usr --root=$pkgdir
  install -Dm644 docs/man/google.1 "$pkgdir/usr/share/man/man1/google.1"
}
