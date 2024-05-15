# Maintainer: bbbb <mxk1 (at) protonmail (dot) com>
# Maintainer: Iliya Ivanov <aur@proforge.org>

pkgname=btrustbiss
pkgver=3.32
pkgrel=1
pkgdesc="Browser independent signing service."
arch=('x86_64')
url="https://www.b-trust.org"
license=('GPL')
source=("$url/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('172d8bbcc496c3a1265b5bbc1995ff071cc9916601eea1fb230933bac2a0b407')
depends=('fakeroot' 'pcsclite' 'glibc' 'gcc-libs' 'xdg-utils' 'zlib')
options=(!strip !emptydirs !makeflags)
install=$pkgname.install

package(){
    # Extract tar package
    tar xvf B-TrustBISS.tar
    # Extract deb package
    ar xv btrustbiss_3.32-1_amd64.deb

    # Install package
    tar Jxf data.tar.xz -C "$pkgdir"
    
    # Fix for wrong permissions on subdirs
    find "$pkgdir" -type d -exec chmod 755 {} \;
}
