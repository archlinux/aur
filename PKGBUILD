# Maintainer: h8red  h8red at yandex dot ru
# Contributor: Thomas Haider <t.haider@deprecate.de> 
pkgname=k10ctl
pkgver=090709
pkgrel=2
pkgdesc="Change voltage and frequency settings of AMD K10 CPUs"
arch=(i686 x86_64)
depends=('bash')
url="http://sourceforge.net/projects/k10ctl/"
license=('GPL3')
install=${pkgname}.install
source=(k10ctl.tar.bz2 \
	    ${pkgname}.sh \
		${pkgname}.rc \
		${pkgname}.conf \
		${pkgname}.service )

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ${srcdir}/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
  install -Dm755 ${srcdir}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}.sh
  install -Dm755 ${srcdir}/${pkgname}.rc ${pkgdir}/etc/rc.d/${pkgname}
  install -Dm644 ${srcdir}/${pkgname}.conf ${pkgdir}/etc/conf.d/${pkgname}
  install -Dm644 ${srcdir}/${pkgname}.service ${pkgdir}/usr/lib/systemd/system/${pkgname}.service
}
sha256sums=('5c0dfb61dbc04a3ffdf1363f2f3a676d935e9eb2ddc86d37ca167a1f82cadb29'
            '0cf512a269ed806307c5f90ad96ed3e711d409be0e2099c3dcbcc82626f6be87'
            '82e11e53bedf258b424250119950306caf443d25ca9aaca214f9d667422b9d5e'
            'e59ca72c305a3d41d0ee05461489f3a072955d084203cb2f2945d5e19285038d'
            'db88ca37c4535a6f6d4e187dca019c4886b708a099bd52c27e7b2dfafb5db537')
