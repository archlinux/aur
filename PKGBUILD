# Maintainer: ghostbuster <ghost_buster+aur@posteo.de>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: tomberry88 <tomberry@live.it>
# Contributor: Gour-Gadadhara Dasa <gour@atmarama.net>
pkgname=xfce4-kbdleds-plugin
pkgver=0.3.0
pkgrel=1
pkgdesc="Xfce keyboard LEDs panel plugin"
arch=('i686' 'x86_64')
url="https://github.com/oco2000/xfce4-kbdleds-plugin"
license=('GPL-2.0-only')
conflicts=("xfce4-kbdleds-plugin-git")
depends=('xfce4-panel')
makedepends=('intltool' 'xfce4-dev-tools')
source=("https://github.com/oco2000/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('dc6c2e195201de2a2d61dc0863bc2b8632a68b4d789c7b3f8b5a7b372f4846fe')
sha512sums=('0633931eadfc1f02dbff2f49889e0ca10c071f7f214515dca3402fbb6bffb5214fa9ccf117b685375b258bcc7d645d28992232c6a6fc2a5090858f94e98dde18')

build() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${pkgname}-${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
