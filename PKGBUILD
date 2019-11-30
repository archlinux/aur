# Maintainer : Colin Berry <colinb969{at}gmail{dot}com>
# Maintainer : oshaboy <noamgilor{at}protonmail{dot}com>
pkgname=flashpoint-bin
pkgver=6.3
pkgrel=2.0
pkgdesc="Launcher for BlueMaxima's Flashpoint - Infinity Edition."
arch=('x86_64')
url="http://bluemaxima.org/flashpoint/"
license=('MIT')
depends=('nss>=3.0'
         'php'
         'gtk3')
optdepends=('wine: non-native game support')
source=('https://bluepload.unstable.life/selif/flashpoint-linux-x64-20191112.tar.gz')
sha256sums=('acc22863f71e257b7dda162643aa941689f52f342af6657a51ab1f49b833272c')

package(){

    mkdir "${pkgdir}/usr" "${pkgdir}/usr/bin" "${pkgdir}/usr/opt"
	cp -rv "${srcdir}/opt" "${pkgdir}/opt"
	cp -rv "${srcdir}/usr" "${pkgdir}/usr"
    # Symlink exec
    ln -s "/opt/flashpoint/FlashpointLauncher" "${pkgdir}/usr/bin/flashpoint"
    # License
    install -Dm644 "${pkgdir}/opt/flashpoint/licenses/LICENSE" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
