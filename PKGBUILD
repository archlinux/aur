# Maintainer: Joey Dumont <joey.dumont@gmail.com>
# Contributor: Pierre Bourdon <delroth@gmail.com>
# Contributor: larsrh <hupel@in.tum.de>

pkgname=gcc-gcj-ecj
pkgver=4.9
pkgrel=5
pkgdesc="A fork of the Eclipse Java bytecode compiler for GCJ"
depends=('gcc6-gcj')
provides=('eclipse-ecj')
conflicts=('eclipse-ecj')
arch=('any')
license=('EPL')
url="http://gcc.gnu.org/java/"
source=("http://mirrors.kernel.org/sources.redhat.com/java/ecj-${pkgver}.jar"
	ecj1)
sha512sums=('28f8c6fdbcb19e950b1d0bafb3bcc7a8cba87bc673aa6027cece116599cdee80f0cf5e95a1440544890239f5c754e8a93ab46d9daedd937faef445d7ea33b226'
            'fec47ecfcfb5ce390f30d6b28a907a7af7d60a3d7572cfd3e53ee683b3767a5c4a7860bed037a1726f237c549b4e4479d905f145cf84ffa80fb42be60d36be7f')
noextract=("ecj-${pkgver}.jar")

package() {
  install -D -m644 "$srcdir/ecj-${pkgver}.jar" "$pkgdir/usr/share/java/eclipse-ecj.jar"
  install -D -m755 "$srcdir/ecj1" "$pkgdir/usr/bin/ecj1"
}
