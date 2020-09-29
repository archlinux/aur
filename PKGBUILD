# Maintainer: Evan McCarthy <evan@mccarthy.mn>

pkgname=libretls
pkgver=3.2.0
pkgrel=3
pkgdesc='Port of libtls from LibreSSL to OpenSSL. Aims to make the libtls API more easily and widely available.'
arch=('x86_64')
url='https://git.causal.agency/${pkgname}/'
license=('ISC')
depends=('openssl')
source=("https://causal.agency/${pkgname}/${pkgname}-${pkgver}.tar.gz")
b2sums=('173341468c6d7280cab8c87022008c0abd2f816d2c0890335940277292f6c6be9ed628667082832dc466a2e852cbd752b7c8b13422ca66cc80d5c0e67be1326b')

build() {
      cd "${pkgname}-${pkgver}"
      ./configure --prefix=/usr
      make all
}

package() {
      cd "${pkgname}-${pkgver}"
          make DESTDIR="$pkgdir/" install
}
