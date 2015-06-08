# Maintainer: eolianoe <eolianoe aT GoogleMAIL DoT CoM>
# Maintainer: Victor Dmitriyev <mrvvitek@gmail.com>
# Contributor: Alucryd <alucryd at gmail dot com>

pkgname='giws'
pkgver='2.0.2'
pkgrel='1'
pkgdesc='A wrapper generator to generate C++ mapping Java classes'
arch=('i686' 'x86_64')
url='http://forge.scilab.org/index.php/p/giws/'
license=(''custom:CeCILL'')
depends=('python2' 'python2-lxml')
source=("http://forge.scilab.org/index.php/p/giws/downloads/get/$pkgname-$pkgver.tar.gz")
md5sums=('e750972da23a13968ad87210acfb2635')

build() {
    cd $srcdir/$pkgname-$pkgver
    python2 ./setup.py build
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python2 ./setup.py install --root=$pkgdir
    install -Dm644 LICENSE $pkgdir/usr/share/licenses/giws/license.txt
}
