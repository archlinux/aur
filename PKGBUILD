# Alloy is developed by the Software Design Group at MIT.
# See https://alloytools.org or https://sdg.csail.mit.edu/.
# Maintainer: Denis Kasak <dkasak AT termina DOT org DOT uk>
# Contributor: Yazhou Tang <tangyazhou518 at outlook dot com>
# Contributor: Markus Legner <markus@legner.ch>
# Contributor: Ivan Kuraj <kaptoxic _at_ yahoo _dot_ com >
# Contributor: Rodney Price <rod@thirdoption.info>

pkgname="alloy"
pkgver=6.2.0
pkgrel=1
pkgdesc="A lightweight modelling language for software design."
url="https://alloytools.org/"
arch=('i686' 'x86_64')
license=('MIT')
depends=('java-runtime')
makedepends=()
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/AlloyTools/org.alloytools.alloy/releases/download/v6.2.0/org.alloytools.alloy.dist.jar"
        "alloy" "alloy.png" "alloy.desktop")
sha256sums=('6b8c1cb5bc93bedfc7c61435c4e1ab6e688a242dc702a394628d9a9801edb78d'
            'a9fcbd5177739a2baf827cce72f604dbba8a71dad34eee0fbd0b1886922f2f81'
            '1864d1c67619a3699443c5e81b446d0e9d8cf04544e38b63f8811ac9553c371b'
            '71abb29793c74fcb2673d4164420cbe1095b2b42213e6d5a2171e6cd027288ab')


package() {
  mkdir -p ${pkgdir}/usr/share/alloy
  mkdir -p ${pkgdir}/usr/bin
  mkdir -p ${pkgdir}/usr/share/{applications,pixmaps}

  cd ${srcdir}
  install -m 644 -D org.alloytools.alloy.dist.jar ${pkgdir}/usr/share/alloy/alloy6.2.0.jar
  install -m 755 -D alloy ${pkgdir}/usr/bin/
  # icon
  install -Dm644 alloy.png $pkgdir/usr/share/pixmaps/alloy.png
  # app file desktop
  install -Dm644 alloy.desktop $pkgdir/usr/share/applications/
}
