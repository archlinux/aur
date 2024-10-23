# Maintainer:  moviuro <moviuro+archlinux@gmail.com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Sebastien Duthil <duthils@free.fr>
# Contributor: mickael9 <mickael9@gmail.com>

pkgname=factorio-dl
pkgver=0.3.0
pkgrel=1
pkgdesc="Factorio downloader script for UNIX(-like) systems"
arch=('any')
license=('custom:BSD')
depends=('curl' 'jq')
install="${pkgname}.install"
url="https://git.sr.ht/~moviuro/${pkgname}"
validpgpkeys=('2CD96FEE343C6799B9CEAFAD62009A2E0C22D9AB')
source=("git+${url}?signed#tag=${pkgver}"
        "${pkgname}.install")
sha256sums=('SKIP'
            '1a44e9c458d2a31686ec0371432c631883be6807ed29b68e80aee59d88a48137')

package() {
  install -Dm 555 "${srcdir}/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 444 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 444 "${srcdir}/${pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

