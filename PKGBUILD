# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
# Contributor: GI_Jack <GI_Jack@hackermail.com>

pkgname=python-pygexf
_pypiname=pygexf
_licensecommit=ac0f51afdc4e304fdd949c7c63ad5d1f96cba326
pkgver=0.2.2
pkgrel=2
pkgdesc="A python library to generate gexf file format"
url="https://github.com/paulgirard/pygexf"
arch=('any')
license=('CECILL-C OR LGPL-3.0-or-later')
depends=('python')
makedepends=('python-setuptools')
source=(
  ${_pypiname}-${pkgver}.tar.gz::"https://github.com/paulgirard/pygexf/archive/v${pkgver}.tar.gz"
  "https://github.com/paulgirard/pygexf/blob/$_licensecommit/LICENSE.CECILL-C"
  "https://github.com/paulgirard/pygexf/blob/$_licensecommit/LICENSE.LGPL"
)
sha256sums=('fabb298582ba05be175704dbf7d9371f68065cda737ce94390ba09b9cdfdf842'
            'e005eb6be675fa1f4f770b47c321021ad5e2321d26f95c5995ee6bcbef58b613'
            'f717aa6200c505bdc6b0eb4be015e2ad278cd566f6ff15f3b775ea34c2579635')

package() {
  cd ${_pypiname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr

  cd "${srcdir}"
  install -Dm0644 LICENSE.CECILL-C "$pkgdir/usr/share/licenses/$pkgname/LICENSE.CECILL-C"
  install -Dm0644 LICENSE.LGPL "$pkgdir/usr/share/licenses/$pkgname/LICENSE.LGPL"
}
