# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>

pkgname=jack-matchmaker
pkgver=0.7.1
pkgrel=2
pkgdesc="A command line tool to auto-connect JACK ports matching given patterns."
arch=('any')
url="https://github.com/SpotlightKid/jack-matchmaker"
license=('GPL2')
depends=('python-setuptools' 'jack')
source=("https://files.pythonhosted.org/packages/source/j/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('85fc73519c4fe97ab105e1267dac94adc070f3405245a36d4974881f07bcd92d')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python setup.py install --skip-build --root="${pkgdir}" --prefix=/usr \
    --optimize=1
}
