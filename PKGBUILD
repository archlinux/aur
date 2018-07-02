# Maintainer: Ricardo (XenGi) Band <email@ricardo.band>
pkgbase=virtualfish
pkgname=('python-virtualfish' 'python2-virtualfish')
pkgver=1.0.6
pkgrel=4
pkgdesc="A virtualenv wrapper for the Fish shell"
arch=(any)
url="https://github.com/adambrenecki/virtualfish"
license=('MIT')
options=(!emptydirs)
install=virtualfish.install
makedepends=('python-setuptools'  'python-setuptools-scm'  'python-virtualenv'  'python-pkgconfig'  'python-psutil'  'python-xdg'
             'python2-setuptools' 'python2-setuptools-scm'  'python2-virtualenv' 'python2-pkgconfig' 'python2-psutil' 'python2-xdg')
source=("${pkgbase}::git+https://github.com/adambrenecki/${pkgbase}.git#tag=${pkgver}")
sha256sums=('SKIP')

prepare() {
    cp -a "$srcdir/$pkgbase"{,-py2}
}

package_python-virtualfish() {
    depends=('python-setuptools' 'python-setuptools-scm' 'python-virtualenv' 'python-pkgconfig' 'python-psutil' 'python-xdg')
    cd "${srcdir}/${pkgbase}"
    python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-virtualfish() {
    depends=('python2-setuptools' 'python2-setuptools-scm' 'python2-virtualenv' 'python2-pkgconfig' 'python2-psutil' 'python2-xdg')
    cd "${srcdir}/${pkgbase}-py2"
    python2 setup.py install --root="$pkgdir/" --optimize=1
}
