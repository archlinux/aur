# Maintainer: Ronuk Raval <ronuk.raval at gmail dot com>

pkgname=python-flexx
pkgver=0.8.0
pkgrel=1
pkgdesc="Write desktop and web apps in pure Python"
arch=('any')
url="https://flexx.readthedocs.io"
license=('BSD')
depends=(
    python
    python-tornado
    'python-pscript>=0.7.1'
    'python-webruntime>=0.5.6'
    'python-dialite>=0.5.2'
)
source=(
    ${pkgname}-${pkgver}.tar.gz::https://github.com/flexxui/flexx/archive/v${pkgver}.tar.gz
)
sha256sums=(
    994fbb5b433012b93db13759514e15a84facb57824adb6194a24378425ee6c10
)

build() {
    cd "flexx-${pkgver}"
    python setup.py build
}

package() {
    cd "flexx-${pkgver}"
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
