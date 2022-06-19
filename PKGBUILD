# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Christoph Stahl <christoph.stahl@uni-dortmund.de>
# Contributor: Serge Victor <arch@random.re>

_pipname=Flask-APScheduler
_reponame=${_pipname,,}
pkgname=python-$_reponame
pkgver=1.12.4
pkgrel=1
pkgdesc='Adds APScheduler support to Flask'
arch=('any')
url="https://github.com/viniciuschiele/$_reponame"
license=('Apache')
depends=('python' 'python-apscheduler' 'python-dateutil' 'python-flask')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d93c36693b0f7da9ecf91e619c81aaf0507c1b5738c00e6b2ed359e09b130b1e')

build() {
  cd "$_reponame-$pkgver"

  python setup.py build
}

package() {
  cd "$_reponame-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
