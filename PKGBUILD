# Maintainer Robert Booster > booster.devel@gmail.com
# Automatic builder > https://github.com/boosterdev/autobuild

pkgname=python2-gmusicapi
_gitver="10.1.2"
pkgver="10.1.2"
pkgrel=1
pkgdesc="An unofficial client library for Google Music"
arch=('any')
url="https://github.com/simon-weber/gmusicapi"
license=('BSD')
depends=('python2-validictory>=0.8.0' 'python2-decorator>=3.3.1' 'mutagen>=1.34' 'python2-requests>=1.1.0' 'python2-dateutil>=1.3'
         'python2-proboscis>=1.2.5.1' 'python2-protobuf>=3.0.0' 'python2-oauth2client>=1.1' 'python2-mock>=0.7.0'
         'python2-appdirs>=1.1.0' 'python2-gpsoauth>=0.2.0' 'python2-mechanicalsoup>=0.4.0' 'python2-six>=1.9.0' 'python2-future')
makedepends=('python2-setuptools' 'git')
source=("${pkgname}::git+$url#tag=${_gitver}")
sha256sums=('SKIP')

package() {
	cd "$pkgname"
	python2 setup.py install --root="$pkgdir" --optimize=1

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
