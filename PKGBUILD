#Maintainer: iamawacko <iamawacko@protonmail.com>
#Contributor: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

pkgver=1.16.1
pkgrel=1

pkgdesc="UI for A decentralized, privacy-preserving, multi-party messaging protocol client (binary distribution)"
provides=('cwtch')
conflicts=('cwtch' 'cwtch-git' 'libcwtch-go')
arch=('x86_64')
url='https://cwtch.im'
license=('MIT')
optdepends=(
    'tor: use system tor instead of packaged'
)
source_x86_64=("https://git.openprivacy.ca/$_pkgname.im/$_pkgname-ui/releases/download/v$pkgver/cwtch-ui-v$pkgver.tar.gz")
sha512sums_x86_64=('cbcf410878c32b0e0ae4951c69f1988e0cd4501d0758c69072ba7c11d0f91a974febc4cc8fc65a6d6112eb18fc2a2b7b594153d6f37b27dba0df23277b63cc23')

package() {
    cd "$srcdir/$_pkgname-ui"
    INSTALL_PREFIX="$pkgdir/usr" DESKTOP_PREFIX="/usr" ./linux/install.sh
}
