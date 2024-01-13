# Maintainer: bbbb <mxk1 (at) protonmail (dot) com>
# Maintainer: Iliya Ivanov <aur@proforge.org>

pkgname=btrustbiss
pkgver=3.28
pkgrel=1
pkgdesc="Browser independent signing service."
arch=('x86_64')
url="https://www.b-trust.org"
license=('GPL')
source=("$url/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('f401a832886addf3e0dc3dd250c53bed9c8594d2a57d9b5fd8b9bdf2f4659a45')
depends=('fakeroot' 'pcsclite' 'glibc' 'gcc-libs' 'xdg-utils' 'zlib')
options=(!strip !emptydirs !makeflags)
install=$pkgname.install

package(){
    # Extract tar package
    tar xvf B-TrustBISS.tar
    # Extract deb package
    ar xv btrustbiss_3.28_amd64.deb

    # Install package
    tar Jxf data.tar.xz -C "$pkgdir"
    
    # Fix for wrong permissions on subdirs
    find "$pkgdir" -type d -exec chmod 755 {} \;
}
