# Maintainer: bbbb <mxk1 (at) protonmail (dot) com>
# Maintainer: Iliya Ivanov <aur@proforge.org>

pkgname=btrustbiss
pkgver=3.34
pkgrel=1
pkgdesc="Browser independent signing service."
arch=('x86_64')
url="https://www.b-trust.org"
license=('GPL')
source=("$url/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('f720964235f17ad253adc1d75671998c84842b213eec87e5d44353db0a46c686')
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
    
    # Fix for wrong permissions on subdirs
    # find "$pkgdir" -type d -exec chmod 755 {} \;
}
