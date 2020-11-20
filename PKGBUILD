# Maintainer: Dimitris Kiziridis <ragouel at outlook dot com>

pkgname=reqview
pkgver=2.9.1
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
sha256sums=('b085e01c59acfcc9a8e21e2481b54fd61d4e6941d78db0757fa4dfbca8cf1d25'
            '169f93960253462efd8efd846f05a8d4755667023f4350f6ca09a8d008938b3e')

package() {
  tar xvf data.tar.xz -C "${pkgdir}/"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
