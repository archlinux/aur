# Maintainer: Sean Enck <enckse@gmail.com>
# Contributor: Kevin Slagle <kjslag at gmail dot com>
pkgname=python-snakeviz
_pythonname=snakeviz
pkgver=0.4.2
pkgrel=1
pkgdesc='A viewer for Python profiling data that runs as a web application in your browser. It is inspired by the wxPython profile viewer RunSnakeRun.'
arch=('any')
url="http://jiffyclub.github.io/snakeviz"
license=('CUSTOM')
depends=('python' 'python-tornado' 'python-jinja')
source=("https://pypi.python.org/packages/f2/2d/dcefb3d1d48b49e8e02d5f97e7bab2ae0c0f53b7aa8942ac21c97bb00a98/${_pythonname}-${pkgver}.zip#md5=0d3808849fb12d8a17057d69baac4207")
md5sums=('0d3808849fb12d8a17057d69baac4207')
options=(!emptydirs)

package() {
  cd "$srcdir/$_pythonname-$pkgver/"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m 644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
