# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=Nu1LL1nuX
pkgname=nu1ll1nux
pkgver=1.1.185
pkgrel=1
pkgdesc='ArchLinux install scripts, with riced configs for the Nu1LL1nuX platform.'
arch=(x86_64)
url="https://gitlab.com/qYp/$pkgname"
license=('MIT')
depends=(dialog)
makedepends=(git)                 
source=("https://gitlab.com/qYp/concise/-/raw/master/x86_64/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst")
sha256sums=('1150118d6961892acf2d9c90fa08d13e4ac49c9eed296f257f87e5d1cd2b9d7d')

pkgver() {
  printf "1.1.""$(git rev-list --count HEAD)"
}

package() {
    install -Dm755 opt/Nu1LL1nuX/{Nu1LL1nuX.sh,pre-install.sh} -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 opt/Nu1LL1nuX/Nu1LL1nuX.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 usr/share/licenses/nu1ll1nux/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
