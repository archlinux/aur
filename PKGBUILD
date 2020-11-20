# Contributor: twa022 <twa022 at gmail dot com>

pkgname=python-screeninfo
pkgver=0.6.6
pkgrel=1
pkgdesc="Python library to fetch location and size of physical screens"
arch=('any')
url="https://github.com/rr-/screeninfo"
license=('MIT')
depends=('python')
optdepends=('libxinerama: xinerama backend'
           'libxrandr: randr backend'
           'libdrm: experimental DRM backend')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/rr-/${pkgname/python-/}/archive/${pkgver}.tar.gz")
sha256sums=('602829a5477bd16d6b410b0b869aefdc856e12fdf6af67af0eab62b32b649871')

package() {
  cd "${srcdir}/${pkgname/python-/}-${pkgver}"
  python setup.py install --root="${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${pkgname/python-/}-${pkgver}/LICENSE.md"
}
