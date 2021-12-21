# Maintainer: Jan Ypma <jan at ypmania dot nl>
pkgname=jjazzlab-x-bin
pkgver=3.0.1
pkgrel=1
pkgdesc="A Midi-based framework dedicated to backing tracks generation"
arch=('i686' 'x86_64')
url="https://www.jjazzlab.com/"
license=('LGPL')
depends=('java-environment>=8')
source=("https://www.jjazzlab.com/pkg/JJazzLab-${pkgver}-Linux.zip" "jjazzlab-x.desktop")
sha256sums=('d135dd7489ebe97ae79b7b431e26e5c756b6a85b8237827578c5d33814bc72bf'
            'ca15408fd0f11505def63f04359bc3c9745c0077a9f3b5953edc31391ee7a882')

package() {
  cd "$srcdir/JJazzLab-${pkgver}-Linux"

  install -d "${pkgdir}/opt/jjazzlab-x"
  cp -rp * "${pkgdir}/opt/jjazzlab-x"

  install -d "${pkgdir}/usr/bin"
  ln -s ${pkgdir}/opt/jjazzlab-x/bin/jjazzlab ${pkgdir}/usr/bin/jjazzlab

  install -d "${pkgdir}/usr/share/applications"
  install ../jjazzlab-x.desktop "${pkgdir}/usr/share/applications"
}
