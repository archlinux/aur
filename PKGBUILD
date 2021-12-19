# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

_pkgname=qhue
pkgbase=python-qhue
pkgname='python-qhue'
pkgdesc='A very lightweight Python wrapper to the Philips Hue API'
pkgver=1.0.12
pkgrel=1
arch=('any')
url='https://github.com/quentinsf/qhue'
license=('GPL2')
depends=('python' 'python-requests')
makedepends=('python-setuptools')
optdepends=('python-yaml: debug print API responses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/quentinsf/${_pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}-${pkgver}.tar.gz.asc::https://github.com/quentinsf/${_pkgname}/releases/download/${pkgver}/qhue-${pkgver}.tar.gz.asc")
sha512sums=('11ea0f9853dd0e26ecae0d6bd22b45f68ba1b19e6bd01379b2a2c67fd80bd1c4f5db9a34d988248b6111b3ea5bba71eddcc5a8390aea16a09e05c4b749a019d0'
            'SKIP')
validpgpkeys=('36F2083F293ED4FD83847B8309328E8BF9464B5F')

package() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
