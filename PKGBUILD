# Maintainer: Brian "Beej Jorgensen" Hall <beej@beej.us>

pkgname=josm-javaws
pkgver=2014112501
pkgrel=3
pkgdesc="An editor for OpenStreetMap written in Java, Java Web Start version"
arch=('any')
url="http://josm.openstreetmap.de/"
license=('GPL')
depends=('java-runtime' 'java-web-start' 'libxtst' 'ttf-font')
backup=('etc/conf.d/josm')
provides=('josm')
conflicts=('josm')
source=('https://josm.openstreetmap.de/download/josm.jnlp'
        'http://josm.openstreetmap.de/browser/trunk/images/logo.png?format=raw'
        'josm.desktop'
        'josm'
        'josm.conf.d')

sha256sums=('6b33e9cce9f61375312c504e7f4328ce9663705bc4fa813effd1fb8b46c59dc0'
            '279c03847dd270a2e9fc07937498af5418960e3636f8f9919125d60805b799a4'
            'edfb2cbf2aa7e6582b4d43cd402ea58be7990702e5ffffc3ff7afdc518c28ca9'
            '345bc3e4436f93f4980051ccec226224fa8d6b513cde8da98294cc3b4bcdc9dc'
            'c86a73251eed42fcb129ae9b88a0ee3cf03d8d00a9385519ad536d5af0907663')

package() {
  cd "${srcdir}"
  
  install -D -m644 josm.jnlp "${pkgdir}"/usr/share/java/josm/josm.jnlp
  install -D -m644 "${srcdir}"/josm.desktop ${pkgdir}/usr/share/applications/josm.desktop
  install -D -m644 'logo.png?format=raw' "${pkgdir}"/usr/share/pixmaps/josm.png
  install -D -m755 josm "${pkgdir}"/usr/bin/josm
  install -Dm644 "${srcdir}"/josm.conf.d "${pkgdir}"/etc/conf.d/josm
}

# vim:set ts=2 sw=2 et:

