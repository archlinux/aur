# Maintainer: Mateusz Kiersnowski

pkgname=reqview
pkgver=2.22.2
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
sha256sums=('9fb7da731db51ad3549c4fbeafd9e0d96e354b54a9b9e514c2a18818e42a986c'
            '169f93960253462efd8efd846f05a8d4755667023f4350f6ca09a8d008938b3e')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
