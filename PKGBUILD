# Maintainer: swix
pkgname=onvif-python
pkgver=0.2.10
pkgrel=1
pkgdesc='A modern Python library for ONVIF-compliant devices'
arch=('any')
url="https://github.com/nirsimetri/${pkgname}"
license=('MIT')
depends=('python'
         'python-setuptools'
         'python-requests'
         'python-zeep')
makedepends=('python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nirsimetri/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('d810ff5bc8ff4930782090fd45796e6c1202292af22743b3dd85d797630e663e7cb8b946b9d5a6ba70c4e905719cf6a7409c7abe44279dcab51822c921254e35')

package() {
    cd "${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}"
    install -Dm 644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
