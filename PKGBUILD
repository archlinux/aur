# Maintainer: Arley Henostroza <arllk[at]gmail[dot]com>

pkgname=hostess
pkgver=0.5.2
pkgrel=1
pkgdesc="An idempotent command-line utility for managing your /etc/hosts file."
arch=('x86_64')
url="https://github.com/cbednarski/${pkgname}"
license=('MIT')
depends=('glibc')
conflicts=('hostess')
provides=('hostess')
source=("${pkgname}-${pkgver}::${url}/releases/download/v${pkgver}/hostess_linux_amd64"
        "LICENSE")
sha256sums=('5b4936fa62e04591677b5e6a8aadf1acc3abc8a6170380c552d958ddaf2514b2'
            'd6e7eb336da929d634d6cddc0a2f5e7e74b92101ec7099a50ca46fbd33b9a01a')

prepare(){
    mv "${pkgname}-${pkgver}" "${pkgname}"
}

package() {
  cd "${srcdir}"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 744 "${pkgname}" -t "${pkgdir}/usr/bin/"
}
