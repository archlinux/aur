# Maintainer: somini <dev@somini.xyz>

pkgname=python-rtpplayapi
_module='rtpplayapi'
pkgver=1.0.3
pkgrel=1
pkgdesc="Create static HTML galleries with thumbnails"
url="https://github.com/guipenedo/rtp-play-api"
depends=('python' 'python-requests')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('0f54272378f3bf9302827b202176f8ddc58f3e2c6f91ec90b01dd78bd7507a80')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
