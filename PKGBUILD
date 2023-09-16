# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Christoph Stahl <christoph.stahl@uni-dortmund.de>
# Contributor: Serge Victor <arch@random.re>

_pipname=Flask-APScheduler
_reponame=${_pipname,,}
pkgname=python-$_reponame
pkgver=1.13.0
pkgrel=1
pkgdesc='Adds APScheduler support to Flask'
arch=('any')
url="https://github.com/viniciuschiele/$_reponame"
license=('Apache')
depends=('python' 'python-apscheduler' 'python-dateutil' 'python-flask')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c0f35f076eb2cf44697c12b6ed5272518d395bd3f61ba1b325bf2747ababf847')

build() {
  cd "$_reponame-$pkgver"

  python setup.py build
}

package() {
  cd "$_reponame-$pkgver"

  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
