# Maintainer: bbbb mxk1 (at) protonmail (dot) com
# Maintainer:  Iliya Ivanov <aur@proforge.org>
# Contributor: ----

pkgname=btrustbiss
pkgver=3.10
pkgrel=7
pkgdesc="Browser independent signing service."
arch=('x86_64')
provides=('btrustbiss')
url="https://www.b-trust.org"
license=('GPL')
source=("https://www.b-trust.bg/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('3ce3a05f538eab59d9212945798d660d71e09f0ab2951e5dc0d3c22198d69341')
depends=('fakeroot' 'pcsclite' 'glibc' 'gcc-libs' 'xdg-utils' 'zlib')
options=('!strip' '!emptydirs' '!makeflags')
install="$pkgname.install"

package(){
    # Extract package
    tar xvf B-TrustBISS.tar
    ar xv btrustbiss_3.10-1_amd64.deb

    # Install package
    tar Jxf data.tar.xz -C "$pkgdir"
    
    # Fix for wrong permissions on subdirs
    find "$pkgdir" -type d -exec chmod 755 {} \;
}
