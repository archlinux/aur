# Maintainer:  moviuro <moviuro+archlinux@gmail.com>
# Contributor: D. Can Celasun <dcelasun[at]gmail[dot]com>
# Contributor: Sebastien Duthil <duthils@free.fr>
# Contributor: mickael9 <mickael9@gmail.com>

pkgname=factorio-dl
pkgver=0.1.3
pkgrel=1
_commit="cda4cfbbae25f7d05284d34e840ca7f8141ebea8"
pkgdesc="Factorio downloader script for UNIX(-like) systems"
arch=('any')
license=('custom:BSD')
depends=('curl')
install="${pkgname}.install"
url="https://gitlab.com/moviuro/${pkgname}"
source=("${pkgname}-${pkgver}.tar.gz::https://gitlab.com/moviuro/${pkgname}/repository/${pkgver}/archive.tar.gz"
        "${pkgname}.install")
sha256sums=('0d6f806b8240463f91455d1647dfb9dd1aa319b2f5d1bfce386b3f6ac36f5585'
            'ae4ea5d2a613364ee7884a39c5a9e032ff7fa175b5cfb4182abf83261086ce89')

package() {
  install -Dm 555 "${srcdir}/${pkgname}-${pkgver}-${_commit}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm 444 "${srcdir}/${pkgname}-${pkgver}-${_commit}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 444 "${srcdir}/${pkgname}-${pkgver}-${_commit}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

