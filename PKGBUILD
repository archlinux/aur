#Maintainer: iamawacko <iamawacko@protonmail.com>
#Contributor: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

_pkgver=1.14.7
pkgver="${_pkgver//-/_}"
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
source_x86_64=("https://git.openprivacy.ca/$_pkgname.im/$_pkgname-ui/releases/download/v$_pkgver/cwtch-v$_pkgver.tar.gz")
sha512sums_x86_64=('465e741781bf342c0bb810dd2f67145628336c05f9e57390045d47d7f3e24be2bf3bc882b6595aade24d7668e46c713ce1b9b66d4b61dac32b80a0dc1c1e9e84')

package() {
    cd "$srcdir/$_pkgname"
    INSTALL_PREFIX="$pkgdir/usr" DESKTOP_PREFIX="/usr" ./install.sh
}
