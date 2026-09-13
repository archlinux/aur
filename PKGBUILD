# Maintainer: Smoolak <smoolak@gmail.com>

pkgname=dmenu-lpass-nu
pkgver=1.0.2
pkgrel=2
pkgdesc="dmenu script for lastpass-cli with account name and account user"
arch=("any")
url="https://smoolak.com/git/Smoolak/dmenu-lpass-nu"
license=('GPL-3.0-or-later')
depends=("bash>=4" "lastpass-cli" "dmenu")
checkdepends=('python')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
        'test-selection.py')
sha256sums=('b4312a8302314fbde2fc3d1f843d5bbed9c61ab1e7ac6e40df218e832ee7fc09'
            '0ecc7eeb9e23ca1f890b4e38ac3bf89f0234aa591c84bb876991aa9e63a4e97e')

check() {
    bash -n "${pkgname}/dmenu-lpass.sh"
    python "$srcdir/test-selection.py" "$srcdir/${pkgname}/dmenu-lpass.sh"
}

package() {
    install -Dm755 "${pkgname}/dmenu-lpass.sh" "$pkgdir/usr/bin/$pkgname"
}
