#Maintainer: iamawacko <iamawacko@protonmail.com>
#Contributor: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

pkgver=1.16.3
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
sha512sums_x86_64=('447fd26cf5a7f51d6cae94cdde1627a5193639d16761cf2c864af8318333105a35deb8ec08ae078f5d1532567dfa2bec05c55d2d1e8b64ce4c722ef268da36c3')

package() {
    cd "$srcdir/$_pkgname-ui"
    INSTALL_PREFIX="$pkgdir/usr" DESKTOP_PREFIX="/usr" ./linux/install.sh
}
