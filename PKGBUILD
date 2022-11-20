# Maintainer: Jelle van der Waa <jelle@vdwaa.nl>
# Contributor: Jelle van der Waa <jelle@vdwaa.nl>

pkgname=python38-webencodings
pkgver=0.5.1
pkgrel=9
arch=('any')
url="https://github.com/gsnedders/python-webencodings"
license=('BSD')
pkgdesc="This is a Python implementation of the WHATWG Encoding standard."
depends=('python38')
makedepends=('python38' 'python38-setuptools')
checkdepends=('python38-nose')
source=($pkgname-$pkgver.tar.gz::https://github.com/gsnedders/python-webencodings/archive/v${pkgver}.tar.gz)
sha256sums=('082367f568a7812aa5f6922ffe3d9d027cd83829dc32bcaac4c874eeed618000')

package_python38-webencodings() {
    cd ${pkgbase}-${pkgver}

    python3.8 setup.py install --root="${pkgdir}"
    install -D -m644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

check() {
    cd ${pkgbase}-${pkgver}/webencodings

    nosetests tests.py
}
