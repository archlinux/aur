# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=Nu1LL1nuX
pkgname=nu1ll1nux
pkgver=1.1.179
pkgrel=1
pkgdesc='ArchLinux install scripts, with riced configs for the Nu1LL1nuX platform.'
arch=(x86_64)
url="https://gitlab.com/qYp/$pkgname"
license=('MIT')
depends=(dialog)
makedepends=(git)                 
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "1.1.""$(git rev-list --count HEAD)"
}

package() {
    cd ${pkgname}
    install -Dm755 Nu1LL1nuX.sh pre-install.sh -t "${pkgdir}/opt/${_pkgname}"
    install -Dm755 Nu1LL1nuX.sh "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
