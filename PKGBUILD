# Maintainer: Brian "Beej Jorgensen" Hall <beej@beej.us>

pkgname=josm-javaws
pkgver='tested'
pkgrel=1
pkgdesc="An editor for OpenStreetMap written in Java, Java Web Start version"
arch=('any')
url="http://josm.openstreetmap.de/"
license=('GPL')
depends=('java-runtime' 'java-web-start' 'libxtst' 'ttf-font')
backup=('etc/conf.d/josm')
provides=('josm')
conflicts=('josm')
source=('https://josm.openstreetmap.de/download/josm.jnlp'
        'https://josm.openstreetmap.de/logo.png'
        'josm.desktop'
        'josm'
        'josm.conf.d')

sha256sums=('3bc056c6bcea2de77901f95b691e873c5fe4e63dba92d4c5008cb356a7f23557'
            '4f7ac6e53fe4660a69b183b0d46596f9ee496d4736a2652326c64ebc5e3023fb'
            'edfb2cbf2aa7e6582b4d43cd402ea58be7990702e5ffffc3ff7afdc518c28ca9'
            '345bc3e4436f93f4980051ccec226224fa8d6b513cde8da98294cc3b4bcdc9dc'
            'c86a73251eed42fcb129ae9b88a0ee3cf03d8d00a9385519ad536d5af0907663')

package() {
  cd "${srcdir}"
  
  install -D -m644 josm.jnlp "${pkgdir}"/usr/share/java/josm/josm.jnlp
  install -D -m644 "${srcdir}"/josm.desktop ${pkgdir}/usr/share/applications/josm.desktop
  install -D -m644 'logo.png' "${pkgdir}"/usr/share/pixmaps/josm.png
  install -D -m755 josm "${pkgdir}"/usr/bin/josm
  install -Dm644 "${srcdir}"/josm.conf.d "${pkgdir}"/etc/conf.d/josm
}

# vim:set ts=2 sw=2 et:

