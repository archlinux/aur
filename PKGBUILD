# Maintainer: Danilo J. S. Bellini <danilo dot bellini at gmail dot com>
pkgname=('python2-arcsi')
pkgver=0.15.0
pkgrel=1
pkgdesc="Atmospheric and Radiometric Correction of Satellite Imagery"
arch=('any')
url='https://bitbucket.org/petebunting/arcsi'
license=('GPL3')
makedepends=('python2-setuptools')
depends=('python2-rios' 'python2-py6s' 'python2-rsgislib')
options=(!emptydirs)
source=("$url/get/$pkgver.tar.bz2")
sha256sums=('676f5accf28c39356ca61af84295f544f73a1a43e273a2d9a3f293fb3ac9dacd')
_hash=f265b33b5e2a

prepare() {
  # Updates the shebang in Python scripts for Python 2
  find "$srcdir/petebunting-arcsi-$_hash" \
       -name "*.py" \
       -exec sed -i '1s/python\s*$/python2/' '{}' \;
}

package() {
  cd "$srcdir/petebunting-arcsi-$_hash"
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
