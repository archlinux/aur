# Contributor: twa022 <twa022 at gmail dot com>

pkgname=python-screeninfo
pkgver=0.6.1
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
sha256sums=('f54b37dbc07400ccf0a682c8db282896baf66ccf48debd51252cfea3b2e6d2a1')

package() {
  cd "${srcdir}/${pkgname/python-/}-${pkgver}"
  python setup.py install --root="${pkgdir}"

  install -Dt "${pkgdir}/usr/share/licenses/${pkgname}" -m644 "${srcdir}/${pkgname/python-/}-${pkgver}/LICENSE.md"
}
