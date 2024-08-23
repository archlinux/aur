# Maintainer: BingBong
# Maintainer: Proton Technologies AG <opensource at proton dot me>
# Maintainer: Alexandru Cheltutior <acrandom at pm dot me>

pkgname=protonvpn-cli
_gitpkgname=linux-cli
pkgver=3.13.0
pkgrel=3
pkgdesc="Official Legacy ProtonVPN Command Line Interface, used to be maintained by the ProtonVPN team."
arch=("any")
url="https://github.com/ProtonVPN"
license=("GPL3")
depends=("python-protonvpn-nm-lib>=3.10.0" "python-pythondialog" "network-manager-applet")
makedepends=("python-setuptools")
source=("https://github.com/ProtonVPN/linux-cli/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('d295d6c899638a88d615e2cacb078ecf2aee8c771ebb087c9edb43aea25aacd9')

build() {
        cd "$_gitpkgname-$pkgver"
        python setup.py build
}

package() {
        cd "$_gitpkgname-$pkgver"
        python setup.py install --root="$pkgdir" --optimize=1
}
