# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pygexf
_pypiname=pygexf
_licensecommit=ac0f51afdc4e304fdd949c7c63ad5d1f96cba326
pkgver=0.2.2
pkgrel=3
pkgdesc="A python library to generate gexf file format"
url="https://github.com/paulgirard/pygexf"
arch=('any')
license=('CECILL-C OR LGPL-3.0-or-later')
depends=('python')
makedepends=('python-setuptools')
source=(
  ${_pypiname}-${pkgver}.tar.gz::"https://github.com/paulgirard/pygexf/archive/v${pkgver}.tar.gz"
  "https://github.com/paulgirard/pygexf/raw/$_licensecommit/LICENSE.CECILL-C"
  "https://github.com/paulgirard/pygexf/raw/$_licensecommit/LICENSE.LGPL"
)
sha256sums=('fabb298582ba05be175704dbf7d9371f68065cda737ce94390ba09b9cdfdf842'
            'b48f5dc16f144cd79ddaadce3cc8ef183778a0b4f75ab4362e134b347ca20f3d'
            'da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr

  cd "${srcdir}"
  install -Dm0644 LICENSE.CECILL-C "$pkgdir/usr/share/licenses/$pkgname/LICENSE.CECILL-C"
  install -Dm0644 LICENSE.LGPL "$pkgdir/usr/share/licenses/$pkgname/LICENSE.LGPL"
}
