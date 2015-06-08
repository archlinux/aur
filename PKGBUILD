# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>

pkgname=nemo-terminal
pkgver=2.6.0
_mintrel=rafaela
pkgrel=1
pkgdesc="An embedded terminal for Nemo, the Cinnamon file manager."
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo-python' 'vte290' 'gobject-introspection')
optdepends=("python2-xdg: Integration with freedesktop.org standards")
install="${pkgname}.install"

options=('!libtool' '!emptydirs')

source=("http://packages.linuxmint.com/pool/main/n/nemo-terminal/${pkgname}_${pkgver}+${_mintrel}.tar.gz")
sha256sums=('ee22b2ae8ced7899a10368b7495e7d7965a6106e3dcf7294950260d4ce54f5f5')

package() {
  install -d ${pkgdir}/usr/share/nemo-python/extensions
  install -d ${pkgdir}/usr/share/glib-2.0/schemas
  install -d ${pkgdir}/usr/share/nemo-terminal
  install ${srcdir}/${pkgname}-${pkgver}+${_mintrel}/src/nemo_terminal.py ${pkgdir}/usr/share/nemo-python/extensions
  install ${srcdir}/${pkgname}-${pkgver}+${_mintrel}/src/org.nemo.extensions.nemo-terminal.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas
  install ${srcdir}/${pkgname}-${pkgver}+${_mintrel}/pixmap/logo_120x120.png ${pkgdir}/usr/share/nemo-terminal
}
