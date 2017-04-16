# Maintainer: johnjq <dev [at] johnjq (dot) com>

pkgname=python-pcloudapi-git
pkgver=v0.0.2.r0.gc303afe
pkgrel=3
pkgdesc="A python3 library for accessing the pcloud.com API"
arch=("any")
url="https://github.com/tochev/python3-pcloudapi"
license=("MIT")
depends=("python" "python-requests")
options=("!emptydirs")
source=("git+https://github.com/tochev/python3-pcloudapi")
sha512sums=("SKIP")

pkgver() {
    cd "python3-pcloudapi"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/python3-pcloudapi"
    python setup.py install --root="$pkgdir/" --optimize=1
    install -m 644 -D LICENCE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
