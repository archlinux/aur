# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgbase=virtualfish
pkgname=('python-virtualfish' 'python2-virtualfish')
pkgname=python-$pkgbase
pkgver=1.0.5
pkgrel=4
pkgdesc="A virtualenv wrapper for the Fish shell"
arch=(any)
url="https://github.com/adambrenecki/virtualfish"
license=('MIT')
depends=('python-virtualenv' 'python2-virtualenv' 'python-setuptools' 'python2-setuptools')
options=(!emptydirs)
install=
source=("${pkgbase}::git+https://github.com/adambrenecki/${pkgbase}.git#tag=1.0.5")
sha1sums=('SKIP')

prepare() {
    cp -a "$srcdir/$pkgbase"{,-py2}
}

package_python-virtualfish() {
    depends=('python-virtualenv' 'python-setuptools')

    cd "${srcdir}/${pkgbase}"
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-virtualfish() {
    depends=('python2-virtualenv' 'python2-setuptools')

    cd "${srcdir}/${pkgbase}-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
