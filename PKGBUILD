# Maintainer: bbbb <mxk1 (at) protonmail (dot) com>
# Maintainer: Iliya Ivanov <aur@proforge.org>

pkgname=btrustbiss
pkgver=3.44
pkgrel=2
pkgdesc="Browser independent signing service."
arch=('x86_64')
url="https://www.b-trust.org"
license=('GPL')
source=("$url/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('a02db035ac7394a5048e999e537a1f318fca09b50b03f0f6826e2b1d84e660cd')
depends=('fakeroot' 'pcsclite' 'glibc' 'gcc-libs' 'xdg-utils' 'zlib')
options=(!strip !emptydirs !makeflags)
install=$pkgname.install

package(){
    # Extract tar package
    tar -xvf B-TrustBISS.tar
    
    # Extract deb package
    ar -xv btrustbiss_"$pkgver"-1_amd64.deb

    # Install package
    tar -Jxf data.tar.xz -C "$pkgdir"
}
