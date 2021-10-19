# Maintainer: Proton Technologies AG <opensource at proton dot me>
# Maintainer: Alexandru Cheltutior <acrandom at pm dot me>
pkgname=python-proton-client
_gitpkgname=proton-python-client
pkgver=0.7.0
pkgrel=1
pkgdesc="Official Proton API Python Client, maintained by the Proton(VPN/Mail) team."
arch=("any")
url="https://github.com/ProtonMail/proton-python-client"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-requests" "python-bcrypt" "python-gnupg" "python-pyopenssl" "python-dnspython")
conflicts=("python-protonvpn-nm-lib<3.4.0")
makedepends=("python-setuptools")
source=("https://github.com/ProtonMail/proton-python-client/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('34c075b4c481f10f500c71ac7a113ba57dc0368d874042e7fc0840c5c5754e26')
validpgpkeys=("A884 41BD 4864 F95B EE08  E63A 71EB 4740 1994 0E11")

build() {
    cd "$_gitpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_gitpkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

