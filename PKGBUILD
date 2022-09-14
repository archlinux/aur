# Maintainer: Proton Technologies AG <opensource at proton dot me>
# Maintainer: Alexandru Cheltutior <acrandom at pm dot me>
pkgname=python-proton-client
_gitpkgname=proton-python-client
pkgver=0.7.1
pkgrel=2
pkgdesc="Official Proton API Python Client, maintained by the Proton(VPN/Mail) team."
arch=("any")
url="https://github.com/ProtonMail/proton-python-client"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-requests" "python-bcrypt" "python-gnupg" "python-pyopenssl" "python-dnspython")
conflicts=("python-protonvpn-nm-lib<3.4.0")
makedepends=("python-setuptools")
source=("https://github.com/ProtonMail/proton-python-client/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('88d2546a922d9053988b5e1863bf6cf965e97b4c643cd879f16bb3f0b5f02b5e')
validpgpkeys=("6A5571928D2222D83BC7456E4EDE055B645F044F")

build() {
    cd "$_gitpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_gitpkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

