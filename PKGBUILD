# Maintainer: bbbb <mxk1 (at) protonmail (dot) com>
# Maintainer: Iliya Ivanov <aur@proforge.org>

pkgname=btrustbiss
pkgver=3.46
pkgrel=1
pkgdesc="Browser independent signing service."
arch=('x86_64')
url="https://www.b-trust.org"
license=('GPL')
source=("$url/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('29d109420b65abe3dda6dde5fa59892dc99d8152cf8f260c768ad550be4ecda0')
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
