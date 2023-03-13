# Maintainer: Javier B. <javierb at protonmail dot com>
pkgname=rimpy-bin
pkgver=1.2.6.29
pkgrel=1
pkgdesc="Mod manager for Rimworld game"
arch=('x86_64')
url="https://github.com/rimpy-custom/RimPy"
license=('unknown')
depends=('glibc')
source=("https://github.com/rimpy-custom/RimPy/releases/download/1.2.6.29/RimPy_Linux.tar.gz"
        "wrapper.sh"
        "rimpy.desktop"
        "rimpy.png")
sha256sums=('2c83a0c3446b8391e9ab98bf5e2332e718d0f0fb10e6b0035ffa45b55311a705'
            '479843351e53514493c9af7728801226ee8ca7278ca4235b1523e0881bf4901f'
            '71959966f6760755dc2a131634b197b989937789be95c9542e1ccee47a5db15e'
            'a2a1030ff224391edf485e6372dbe246530ec6c96a03fd3c1705ffb37ee17cc2')
options=('!strip')
noextract=('RimPy_Linux.tar.gz')

package() {
	cd $srcdir
	install -Dm755 wrapper.sh "${pkgdir}/usr/bin/rimpy"
	sed -i "s/@RIMPY_VERSION@/${pkgver}-${pkgrel}/g" "${pkgdir}/usr/bin/rimpy"
	install -Dm644 RimPy_Linux.tar.gz "${pkgdir}/opt/rimpy/RimPy_Linux_${pkgver}-${pkgrel}.tar.gz"
	install -Dm644 rimpy.desktop "${pkgdir}/usr/share/applications/rimpy.desktop"
	install -Dm644 rimpy.png "${pkgdir}/usr/share/pixmaps/rimpy.png"
}
