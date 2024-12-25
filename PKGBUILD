#Maintainer: iamawacko <iamawacko@protonmail.com>
#Contributor: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

pkgver=1.15.4
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
source_x86_64=("https://git.openprivacy.ca/$_pkgname.im/$_pkgname-ui/releases/download/v$pkgver/cwtch-v$pkgver.tar.gz")
sha512sums_x86_64=('0c3ab640cbbfa665728812e31f3e1bb641f8d6970c2c617a1b3e8d91155b5b63df6d27acc7cce0392a7d31d853504a5b72a304e39fb7654a904b775a97ea0be9')

package() {
    cd "$srcdir/$_pkgname"
    INSTALL_PREFIX="$pkgdir/usr" DESKTOP_PREFIX="/usr" ./install.sh
}
