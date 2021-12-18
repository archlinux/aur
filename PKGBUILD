# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Christoph Stahl <christoph.stahl@uni-dortmund.de>
# Contributor: Serge Victor <arch@random.re>

_pipname=Flask-APScheduler
_reponame=${_pipname,,}
pkgname=python-$_reponame
pkgver=1.12.3
pkgrel=1
pkgdesc='Adds APScheduler support to Flask'
arch=('any')
url="https://github.com/viniciuschiele/$_reponame"
license=('Apache')
depends=('python' 'python-apscheduler' 'python-dateutil' 'python-flask')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('9997f077d1328548e015db31aca0422bb08b551791f93935cd83bba1968d7892')

build() {
  cd "$_reponame-$pkgver"

  python setup.py build
}

package() {
  cd "$_reponame-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
