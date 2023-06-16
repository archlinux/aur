#Maintainer: Trevor Bergeron <mal@sec.gd>

_pkgname=cwtch
pkgname=$_pkgname-bin

_pkgver=1.12.0
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
source_x86_64=("$url/releases/$_pkgname-v${_pkgver%.0}/$_pkgname-v$_pkgver.tar.gz")
sha512sums_x86_64=('2cf58bbb8de52b234582aac9b82dc68f4eb39b975a8ad3b797ed6ac955a021fdc71628c833de140c90eaafd381f95ab6bb914e63e9264f6ca3f830006e238556')

package() {
    cd "$srcdir/$_pkgname"
    INSTALL_PREFIX="$pkgdir/usr" DESKTOP_PREFIX="/usr" ./install.sh
}
