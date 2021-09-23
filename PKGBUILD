# Maintainer: Proton Technologies AG <opensource at proton dot me>
# Maintainer: Alexandru Cheltutior <acrandom at pm dot me>
pkgname=python-proton-client
_gitpkgname=proton-python-client
pkgver=0.6.1
pkgrel=4
pkgdesc="Official Proton API Python Client, maintained by the Proton(VPN/Mail) team."
arch=("any")
url="https://github.com/ProtonMail/proton-python-client"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-requests" "python-bcrypt" "python-gnupg" "python-pyopenssl" "python-dnspython")
conflicts=("python-protonvpn-nm-lib<3.4.0")
makedepends=("python-setuptools")
source=("https://github.com/ProtonMail/proton-python-client/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('7230d434bf2eb330b9881e4b2b3a52ffb7d436ec685e3470df48b87aecb5d7db')
validpgpkeys=("A884 41BD 4864 F95B EE08  E63A 71EB 4740 1994 0E11")

build() {
    cd "$_gitpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_gitpkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

