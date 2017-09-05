# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=nroffedit
pkgver=2.08
pkgrel=3
pkgdesc="WYSIWYG Internet-Draft Nroff Editor"
arch=( 'x86_64' )
url="http://aaa-sec.com/nroffedit/"
license=( 'custom' )
depends=( 'java-runtime' )
_pkgname=NroffEdit
_pkgver=${pkgver//./}
source=("http://aaa-sec.com/pub/${_pkgname}/${_pkgname}Jar${_pkgver}.zip"
	"${pkgname}"
	"license"
        "${_pkgname}Jar${_pkgver}.zip.sig"
	"${pkgname}.sig"
	"license.sig")
sha512sums=('d1afbe6355743ce7af562bb6502b6cfb7184b38e0e8b5d60f3fe98c5ea9f655a994fad4cac91d2e6f93204368afffb8d708fd84e60a67f4e0ab4b584d2404bd6'
	    '621605b6f6962083804a740dc7d2f45ee042f45d978fe22d4b24543a1b9b9a4dc44e345b42d58f2ec5ac5e940b47d2905f19c346017ad9bc569fb0075e925ba1'
	    '04f683fb46749ba83b120ddd1e036032a43219d02d6e74b3599b72d5889595594f38165908c193a8adbc2e4b555ed8eae1592953c494d1c46f79bce02b50d9bc'
            'SKIP'
	    'SKIP'
	    'SKIP')

package() {
	install -d -m0755 ${pkgdir}/usr/share/java/${pkgname}
	install -d -m0755 ${pkgdir}/usr/share/doc/${pkgname}
	install -d -m0755 ${pkgdir}/usr/share/licenses/${pkgname}
	install -d -m0755 ${pkgdir}/usr/bin
	install -D ${srcdir}/license -m0644 ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m0755 ${srcdir}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
	cp -a ${srcdir}/${_pkgname}/* ${pkgdir}/usr/share/java/${pkgname}
	mv ${pkgdir}/usr/share/java/${pkgname}/README.txt ${pkgdir}/usr/share/doc/${pkgname}/README
}
