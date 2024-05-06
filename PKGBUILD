# Maintainer: Mateusz Kiersnowski

pkgname=reqview
pkgver=2.19.0
pkgrel=1
pkgdesc="A simple yet powerful requirements management tool in which you can easily capture structured requirements for a software or system product and track traceability to design, tests and risks of the developed product"
arch=('x86_64')
url='https://www.reqview.com'
license=("custom:${pkgname}")
depends=('gtk3'
         'libxss'
         'nss')
makedepends=('tar')
source=("${pkgname}-${pkgver}.deb::https://s3.eu-central-1.amazonaws.com/reqview-desktop-linux/ReqView-${pkgver}-linux-amd64.deb"
        'LICENSE')
sha256sums=('34f378ce84bc742f5ef15ceb657e0469f8a7f30e7bb976c7b51658be8a0bc8c5'
            '169f93960253462efd8efd846f05a8d4755667023f4350f6ca09a8d008938b3e')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
