# Maintainer Ayakael (Antoine Martin) <antoine.martin@protonmail.com>

pkgname=hfsprescue-bin
_pkgname=hfsprescue
pkgver="3.2"
pkgrel=1
pkgdesc="A program to recover hfs+ file systems"
url="https://www.plop.at/en/hfsprescue/full.html"
arch=('i686' 'x86_64')
license=('GPL2')
source=(
"https://download.plop.at/hfsprescue/hfsprescue-${pkgver}-precompiled.tar.gz"
"LICENSE"
)
sha256sums=(
'83269af382db8ef7880f6c8aa4c3d1f960ea0a2d05571d1c8f182389cf6e6501'
'8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643'
)

package() {
       	if [ ${CARCH} == "i686" ]; then
               install -Dm755 "$srcdir/hfsprescue-${pkgver}-precompiled/Linux/hfsprescue_x32" "$pkgdir/usr/bin/hfsprescue"
       	elif [ ${CARCH} == "x86_64" ]; then
               install -Dm755 "$srcdir/hfsprescue-${pkgver}-precompiled/Linux/hfsprescue_x64" "$pkgdir/usr/bin/hfsprescue"
       	fi

	install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"	
}
