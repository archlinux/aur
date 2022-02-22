# Maintainer: Connor Etherington <connor@concise.cc>
# ---
_pkgname=Nu1LL1nuX
pkgname=nu1ll1nux
pkgver=1.0.169
pkgrel=1
pkgdesc='ArchLinux install scripts for the Nu1LL1nuX platform.'
arch=(x86_64)
url="https://gitlab.com/qYp/$pkgname"
license=('MIT')
depends=(dialog)
makedepends=(git)                 
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  printf "1.0.""$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${pkgname}
    for x in Nu1LL1nuX.sh pre-install.sh .skell; do
    mkdir -p "${pkgdir}/usr/local/bin/${_pkgname}"
    mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm755 ${_pkgname}/$x -t ${pkgdir}/usr/local/bin/${_pkgname}/$x
    install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    done
}
