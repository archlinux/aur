# Maintainer: bbbb <mxk1 (at) protonmail (dot) com>
# Maintainer: Iliya Ivanov <aur@proforge.org>

pkgname=btrustbiss
pkgver=3.44
pkgrel=3
pkgdesc="Browser independent signing service."
arch=('x86_64')
url="https://www.b-trust.org"
license=('GPL')
source=("$url/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('a02db035ac7394a5048e999e537a1f318fca09b50b03f0f6826e2b1d84e660cd')
depends=('pcsclite' 'xdg-utils' 'zlib')
options=(!strip)
install=${pkgname}.install

package(){
    cd "$srcdir"

    # Extract main tar
    tar -xf B-TrustBISS.tar

    # Extract deb package
    ar -x "btrustbiss_${pkgver}-1_amd64.deb"

    # Install files
    tar -Jxf data.tar.xz -C "$pkgdir"
}
