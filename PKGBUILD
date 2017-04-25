# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: Kevin Slagle <kjslag at gmail dot com>
pkgname=python-snakeviz
_pythonname=snakeviz
pkgver=0.4.1
pkgrel=1
pkgdesc='A viewer for Python profiling data that runs as a web application in your browser. It is inspired by the wxPython profile viewer RunSnakeRun.'
arch=('any')
url="http://jiffyclub.github.io/snakeviz"
license=('CUSTOM')
depends=('python' 'python-tornado' 'python-jinja')
source=("https://pypi.python.org/packages/66/64/878a27633fad02b9d6c2b4e951ff30fa311a62202f076bd736e11082a7df/${_pythonname}-${pkgver}.tar.gz#md5=8bdc5cc3c7d1cd33f69783f138f0b3dd")
md5sums=('8bdc5cc3c7d1cd33f69783f138f0b3dd')
options=(!emptydirs)

package() {
  cd "$srcdir/$_pythonname-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
