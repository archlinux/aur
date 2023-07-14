# Maintainer: RealStickman <mrc+aur _a_ frm01 _d_ net>

pkgname=ofxstatement-iso20022-git
pkgver=0.6.0.r13.gc17d0f5
pkgrel=1
pkgdesc="Plugin to read ISO-20022 formatted statements."
arch=('any')
url="https://github.com/kedder/ofxstatement-iso20022"
license=('GPL')
depends=('ofxstatement')
makedepends=('git')
source=('git+https://github.com/kedder/ofxstatement-iso20022.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir" --optimize=1
}
