# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Morten Linderud <morten@linderud.pw>

pkgname=python-vagrant
pkgver=0.5.15
pkgrel=5
pkgdesc="Python bindings for interacting with Vagrant virtual machines."
url="https://github.com/todddeluca/python-vagrant"
license=('MIT')
arch=('any')
depends=('python')
makedepends=('python' 'python-setuptools')
#checkdepends=('vagrant')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/todddeluca/python-vagrant/archive/${pkgver}.tar.gz")
sha512sums=('3763b479fc0c540aec841f38d513d1f836eb17236703ee3490199cd22dde06585b362570ffb823ec63ef0dbdf94f1b38f68928b4be95557fad7137edc7410dd1')


build() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py build
}

# Disabled, because they need Vagrant. Systemd-nspawn doesn't support this.
#check() {
#  cd "${srcdir}/${pkgbase}-${pkgver}"
#  python setup.py test
#}

package() {
  cd "${srcdir}/${pkgbase}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
