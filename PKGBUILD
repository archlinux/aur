# Maintainer: firlin123 <firlin123@gmail.com>

pkgname=jupiter-dkms
_tag='e32d2149de5fe3c73cad347ccbc6e257484f1516' # git rev-parse v${_tag_name}
pkgver=1.0
pkgrel=1
pkgdesc='Jupiter ACPI platform driver DKMS - module sources'
url='https://github.com/firlin123/jupiter-dkms'
arch=('any')
license=('GPL')
depends=('dkms')
makedepends=('git')
source=("git+https://github.com/firlin123/jupiter-dkms.git#tag=${_tag}"
        'dkms.conf')
b2sums=('SKIP'
        '6bd3eac1bad7cff3bf52eeab3a4c85698beecc379771c54c577b82e822aab688f527672d31f9de5af51e8a7bc4753587e10e3cb7d464090221906c2c2fa30658')

package() {
  install -D -m0644 jupiter-dkms/{Makefile,jupiter.c} dkms.conf -t "${pkgdir}"/usr/src/jupiter-${pkgver}
  echo jupiter | install -D -m0644 /dev/stdin "${pkgdir}"/usr/lib/modules-load.d/jupiter.conf
}

# vim: ts=2 sw=2 et:
