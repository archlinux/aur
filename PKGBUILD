# First Linux Arch packager: Serge Victor <arch@random.re>
# Current Packager: Christoph Stahl <christoph.stahl@uni-dortmund.de>

_pipname=Flask-APScheduler
pkgbase=python-flask-apscheduler
pkgname=('python2-flask-apscheduler' 'python-flask-apscheduler')
pkgver=1.3.7
pkgrel=1
pkgdesc="Adds APScheduler support to Flask"
arch=('any')
url="https://github.com/viniciuschiele/flask-apscheduler"
license=('Apache')
makedepends=('python2-setuptools' 'python-setuptools')
source=("https://pypi.python.org/packages/source/${_pipname:0:1}/$_pipname/$_pipname-$pkgver.tar.gz")
md5sums=('b619a21332536ecf6992c6323e7cddd9')


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

