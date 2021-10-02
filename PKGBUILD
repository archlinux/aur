# Contributor: twa022 <twa022 at gmail dot com>

pkgname=python-screeninfo
pkgver=0.7
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
sha256sums=('01242be545f9191d11ffd7b17284b6864534533d171cfa2b1c3c12a6d08def9d')

package() {
  cd "${srcdir}/${pkgname/python-/}-${pkgver}"
  python setup.py install --root="${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${pkgname/python-/}-${pkgver}/LICENSE.md"
}
