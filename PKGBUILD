# Maintainer: Proton Technologies AG <opensource at proton dot me>
# Maintainer: Alexandru Cheltutior <acrandom at pm dot me>
pkgname=protonvpn-cli
_gitpkgname=linux-cli
pkgver=3.9.1
pkgrel=1
pkgdesc="Official ProtonVPN Command Line Interface, maintained by the ProtonVPN team."
arch=("any")
url="https://github.com/ProtonVPN/"
license=("GPL3")
groups=("ProtonVPN")
depends=("python-protonvpn-nm-lib" "python-pythondialog")
makedepends=("python-setuptools")
source=("https://github.com/ProtonVPN/linux-cli/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('067167836c6a19044ca6a40431cccabafb9642c4f9f70487d0192bfd4776704f')
validpgpkeys=("A884 41BD 4864 F95B EE08  E63A 71EB 4740 1994 0E11")

build() {
    cd "$_gitpkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$_gitpkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
