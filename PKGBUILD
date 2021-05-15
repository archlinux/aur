# Maintainer: Karthik <kndevl@outlook.com>
# Contributor: Sean Enck <enckse@gmail.com>
# Contributor: Kevin Slagle <kjslag at gmail dot com>

pkgname=python-snakeviz
_pythonname=snakeviz
pkgver=2.1.0
pkgrel=1
pkgdesc='A viewer for Python profiling data that runs as a web application in your browser. It is inspired by the wxPython profile viewer RunSnakeRun.'
arch=('any')
url="http://jiffyclub.github.io/snakeviz"
license=('CUSTOM')
depends=('python' 'python-tornado' 'python-jinja')
source=("$_pythonname-$pkgver.tar.gz::https://github.com/jiffyclub/snakeviz/archive/v$pkgver.tar.gz")
sha256sums=('b26c3addda05477b1f7a8f331252a9432e451060ff8f1289e79aad80d852ab7a')
options=(!emptydirs)

package() {
  cd "$srcdir/$_pythonname-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
