#Maintainer: iamawacko <iamawacko@protonmail.com>
#Contributor: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

pkgver=1.16.2
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
sha512sums_x86_64=('1ae959375d288930dca9c18bf95b7c799f5c2bb95ce3bb62644bd37699cd385f196d91454a74b9c6a3f23bebe47789937368a5e3e3be31ba741c1cf72aa28574')

package() {
    cd "$srcdir/$_pkgname-ui"
    INSTALL_PREFIX="$pkgdir/usr" DESKTOP_PREFIX="/usr" ./linux/install.sh
}
