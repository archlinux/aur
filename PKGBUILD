# Maintainer: ghostbuster <ghost_buster+aur@posteo.de>
# Contributor: Raphael Scholer <rscholer@gmx.de>
# Contributor: tomberry88 <tomberry@live.it>
# Contributor: Gour-Gadadhara Dasa <gour@atmarama.net>
pkgname=xfce4-kbdleds-plugin
pkgver=0.2.5
pkgrel=1
pkgdesc="Xfce keyboard LEDs panel plugin"
arch=('i686' 'x86_64')
url="https://github.com/oco2000/xfce4-kbdleds-plugin"
license=('GPL2')
conflicts=("xfce4-kbdleds-plugin-git")
depends=('xfce4-panel')
makedepends=('intltool' 'xfce4-dev-tools')
source=("https://github.com/oco2000/${pkgname}/archive/${pkgname}-${pkgver}.tar.gz")
install="${pkgname}.install"
sha256sums=('d4af60e89230bdc36771c20531b19fe92efab2d1ade80f5856fc8a8fb9201668')

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
