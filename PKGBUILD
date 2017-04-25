# Maintainer: Tobias Roettger <dev@roettger-it.de>

pkgname=pymodoro-i3blocks
pkgver=0.1.0
pkgrel=1
pkgdesc='Displays and manages Pymodoro session states via i3blocks.'
arch=(any)
url="https://github.com/toroettg/pymodoro-i3blocks"
license=('Apache')
depends=('python' 'pymodoro-git')
makedepends=('python-setuptools')
options=(!emptydirs)
source=("https://pypi.python.org/packages/7a/87/234cb42997519e7b6d6141d1e9c023cbd8cba2272e88252b61e3630a2869/${pkgname}-${pkgver}.tar.gz")
sha256sums=('28fcfc107cf08635f3d3c323c7dd09f87174f3172de5a236122c75e69b73f0ee')

package() {
  cd "${srcdir}/${pkgname}-$pkgver"
  python setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
