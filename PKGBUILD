pkgname=python2-detox
_realname=detox
pkgver=0.10.0
pkgrel=3
pkgdesc="distributing activities of the tox tool"
url="http://bitbucket.org/hpk42/detox"
depends=('python2' 'python2-tox>=2.0.0' 'python2-py>=1.4.27' 'python2-eventlet>=0.15.0')
license=('MIT')
arch=('any')
source=("http://pypi.python.org/packages/source/d/$_realname/$_realname-$pkgver.tar.gz")
md5sums=('b30e4d4358d9ca43659056c713279196')

build() {
    cd $srcdir/$_realname-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/$_realname-$pkgver
    python2 setup.py install --root="$pkgdir" --optimize=1
    mv "${pkgdir}/usr/bin/detox" "${pkgdir}/usr/bin/detox2"
}
