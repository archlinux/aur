# Maintainer: Jerome Leclanche <jerome@leclan.ch>

_project=pubsub
_pkgname=Pypubsub
pkgname=python-$_project
pkgver=4.0.0
pkgrel=1
pkgdesc="Python Publish-Subscribe Package"
arch=("any")
license=("BSD")
url="https://pypi.python.org/pypi/PyPubSub"
depends=("python")
makedepends=("python-setuptools")
source=("https://pypi.python.org/packages/14/80/8e1d34848fea10826763600ca7eeb7a76d914ccab7cb0d64c9c180c30a73/$_pkgname-$pkgver.zip#md5=20941dd6ceaf1085ed5f3591d0edfa6b")
md5sum=("20941dd6ceaf1085ed5f3591d0edfa6b")

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    python setup.py install --prefix=/usr --root="$pkgdir" --optimize=1 --skip-build
}
md5sums=('20941dd6ceaf1085ed5f3591d0edfa6b')
