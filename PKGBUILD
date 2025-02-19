# Maintainer: Rafael Baboni Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Miguel de Val-Borro <miguel dot deval at gmail dot com>
# Contributor: Mihai Coman <mihai@m1x.ro>
# Contributor: Alexander Vynnyk <cosmonaut@mail.ua>

_appname=skychart
pkgname=${_appname}-bin
pkgver=4.2.1
pkgrel=3
pkgdesc="Free software to draw sky charts, also known as Cartes du Ciel"
arch=('x86_64')
license=('GPL-2.0-or-later')
depends=('glib2' 'glibc' 'at-spi2-core' 'cairo' 'gdk-pixbuf2' 'gtk2' 'hicolor-icon-theme' 'libx11' 'pango' 'xplanet' 'libpasastro')
provides=("${_appname}=${pkgver}")
conflicts=("${_appname}")
url="http://www.ap-i.net/skychart/start"
options=(!strip)
source=("http://sourceforge.net/projects/skychart/files/1-software/version_${pkgver}/skychart-${pkgver}-4073-linux_"${arch}".tar.xz")
sha256sums=('fcf1d19df6e7082c5057342248bc5159847c85ca5a678013f6b6447c036d4520')

package() {
    mkdir "${pkgdir}"/usr/

    tar -xf "${srcdir}"/skychart-"$pkgver"-4073-linux_"${arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
    chown -R root:root "${pkgdir}/usr/"
}
