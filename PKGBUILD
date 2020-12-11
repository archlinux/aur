# Maintainer: Benedikt Vollmerhaus <benedikt[at]vollmerhaus[dot]org>

pkgname=statis
pkgver=1.1.0
pkgrel=1
pkgdesc='Modular system monitoring and status display via desktop notifications.'
arch=('any')
url="https://gitlab.com/BVollmerhaus/${pkgname}"
license=('MIT')
depends=('python')
optdepends=('libnotify: for desktop notifications'
            'dunst: for desktop notifications')
makedepends=('python-setuptools')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('f434b94033e63632cbaad7fe6c06894f8a66dd2d4f990469daf174525ec0e632')

build() {
  cd "${pkgname}-v${pkgver}"
  python setup.py build
}

package() {
  cd "${pkgname}-v${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
