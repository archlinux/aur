# Maintainer: Armin K. <krejzi at email dot com>

pkgname=im-chooser
pkgver=1.6.4
pkgrel=2
pkgdesc="GUI configuration tool for IMSettings"
arch=('i686' 'x86_64')
url="https://fedorahosted.org/im-chooser/"
license=('GPL2')
depends=('desktop-file-utils' 'gtk3' 'imsettings' 'libsm')
makedepends=('libxfce4util')
optdepends=('libxfce4util: for xfce4-im-chooser')
options=('!libtool')
source=("https://fedorahosted.org/releases/i/m/${pkgname}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('7ec7d2893bf0f49e6894c5f80a43a053756522a10edb4d49c2ba5883f41e3b80')
install=im-chooser.install

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  make install DESTDIR="${pkgdir}"

  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
