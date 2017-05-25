# Maintainer: Miguel de Val-Borro <miguel@archlinux.net>
# Contributor: Mihai Coman <mihai@m1x.ro>
# Contributor: Alexander Vynnyk <cosmonaut@mail.ua>

pkgname=skychart
pkgver=4.0
pkgrel=3
pkgdesc="Free software to draw sky charts, also known as Cartes du Ciel"
arch=('i686' 'x86_64')
license=('GPL')
depends=('gtk2' 'xplanet' 'libpasastro')
url="http://www.ap-i.net/skychart/start"

case $CARCH in
i686)
       _real_arch=i386
       sha1sums=('76a2276dd7233e2599b1616a64881165bc6dd665')
;;
x86_64)
       _real_arch=x86_64
       sha1sums=('95af60ead022b3b92c5892c5e59bea7e442ebc17')
;;
esac

source=(http://sourceforge.net/projects/skychart/files/1-software/version_${pkgver}/skychart-${pkgver}-3575-linux_"${_real_arch}".tar.xz)

package() {
mkdir "${pkgdir}"/usr/
tar -xf "${srcdir}"/skychart-"$pkgver"-3575-linux_"${_real_arch}".tar.xz --strip 1 -C "${pkgdir}/usr/"
chown -R root:root "${pkgdir}/usr/"
}
