# Maintainer Ayakael (Antoine Martin) <antoine.martin@protonmail.com>

pkgname=hfsprescue-bin
_pkgname=hfsprescue
pkgver="3.3"
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
'e59087d60800c683343179b2b53880f4a9987da59ea1f527436ec71b0793c9db'
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
