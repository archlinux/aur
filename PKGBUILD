# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=analyzemft
_pkgname=analyzeMFT
pkgver=2.0.19
pkgrel=1
pkgdesc='Analyze the $MFT from a NTFS filesystem.'
arch=('any')
url="https://pypi.org/project/analyzeMFT"
license=('CPL')
depends=('python2')
makedepends=('python2-setuptools')
source=("https://files.pythonhosted.org/packages/2e/a9/9c6ad02f88918c868b737c69eea9e775fbf96dd1c72444e1f1e7534740b8/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('e7bce450b58767bab48c55e7dbee8557ff142309581d24789d9510a1f3cade58')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

# vim:set ts=2 sw=2 et:
