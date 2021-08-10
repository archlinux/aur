# Maintainer: Proton Technologies AG <opensource at proton dot me>
# Maintainer: Alexandru Cheltutior <acrandom at pm dot me>
pkgname=python-proton-client
_gitpkgname=proton-python-client
pkgver=0.5.1
pkgrel=2
pkgdesc="Official Proton API Python Client, maintained by the Proton(VPN/Mail) team."
arch=("any")
url="https://github.com/ProtonMail/proton-python-client"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-requests" "python-bcrypt" "python-gnupg" "python-pyopenssl")
makedepends=("python-setuptools")
source=("https://github.com/ProtonMail/proton-python-client/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('941cd8bc41a9e976c98d40f64474c7f8c9070958118c659cfd5b41c7e1a80332')
validpgpkeys=("A884 41BD 4864 F95B EE08  E63A 71EB 4740 1994 0E11")

build() {
    cd "$_gitpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_gitpkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

