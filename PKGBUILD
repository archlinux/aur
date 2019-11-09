# Maintainer: Christian Mauderer <oss@c-mauderer.de>

pkgname='python-eq3bt'
pkgver='0.1.11'
pkgrel=2
pkgdesc='Python library and command-line tool for EQ3 Smart Bluetooth thermostats.'
arch=('any')
url='https://github.com/rytilahti/python-eq3bt'
license=('MIT')
depends=('python' 'python-click-datetime' 'python-construct' 'python-bluepy')
makedepends=('python-setuptools')
source=("https://github.com/rytilahti/${pkgname}/archive/${pkgver}.tar.gz")
sha512sums=('70a272629b0a27b7492b2d3e681bb0fb78e1163cbf447c1aa5eb34f76da41a936d73eb0ad6088f819e8efe6668237e672f7b28a171f0dc28a0c8d54a6d38e6ef')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install -O1 --skip-build --prefix=/usr --root="${pkgdir}"
}
