# First Linux Arch packager: Serge Victor <arch@random.re>
# Current Packager: Christoph Stahl <christoph.stahl@uni-dortmund.de>

_pipname=Flask-APScheduler
pkgbase=python-flask-apscheduler
pkgname=('python2-flask-apscheduler' 'python-flask-apscheduler')
pkgver=1.6.0
pkgrel=1
pkgdesc="Adds APScheduler support to Flask"
arch=('any')
url="https://github.com/viniciuschiele/flask-apscheduler"
license=('Apache')
makedepends=('python2-setuptools' 'python-setuptools' 'python2-flask' 'python-flask' 'python2-apscheduler' 'python-apscheduler')
source=("https://github.com/viniciuschiele/flask-apscheduler/releases/download/${pkgver}/${_pipname}-${pkgver}.tar.gz")

prepare() {
    cp -R $_pipname-$pkgver python2-$_pipname-$pkgver
}

package_python2-flask-apscheduler() {
depends=('python2-flask' 'python2-apscheduler')

    cd python2-$_pipname-$pkgver
    python2 setup.py install --root="$pkgdir/" --optimize=1
}

package_python-flask-apscheduler() {
depends=('python-flask' 'python-apscheduler')

    cd $_pipname-$pkgver 
    python setup.py install --root="$pkgdir/" --optimize=1
}

md5sums=('7129d36d64f688ba5f55aee310e15fd8')
