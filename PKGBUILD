# Maintainer: bbbb <mxk1 (at) protonmail (dot) com>
# Maintainer: Iliya Ivanov <aur@proforge.org>

pkgname=btrustbiss
pkgver=3.35
pkgrel=2
pkgdesc="Browser independent signing service."
arch=('x86_64')
url="https://www.b-trust.org"
license=('GPL')
source=("$url/attachments/BtrustPrivateFile/24/docs/B-TrustBISS.tar")
sha256sums=('ab2ac7499b3f544f16c93f50b4069b4891440c4026915db6d6cdef547ad3ac83')
depends=('fakeroot' 'pcsclite' 'glibc' 'gcc-libs' 'xdg-utils' 'zlib' 'openssl-1.1' 'boost-libs')
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
