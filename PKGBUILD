# Maintainer: Oscar Garcia Amor <ogarcia@connectical.com>

pkgname=otf-ibarra-real
pkgver=2.1
pkgrel=2
pkgdesc='Serif font used for 1780 edition of El Quijote'
arch=('any')
license=('custom:as-is')
url='http://www.unostiposduros.com/unostiposduros-distribuye-la-tipografia-ibarra-real/'
depends=('fontconfig' 'xorg-font-utils')
source=('http://www.unostiposduros.com/wp-content/uploads/2010/05/Ibarra-Real.zip'
        'LICENSE')
sha512sums=('c988a6808ce5fc9d235f01e21d2f28c8a4d85f8f8e8e940240c607bc9d2c715cb3c19a61e997b9d8c4f779decf535d382af544af7e241772d8a9b14cacd1e6b2'
            '6b8e2ab35ae691a55ce385d5065f591099714aa6024778dcbf7f2910a3fd059f346999f0013c0bf5b5bea31504c765f49ce843fe0d77eed0f9d5ece740d8a4d5')
install=$pkgname.install

prepare() {
  mv "Ibarra Real"/*.otf .
}

package() {
	install -dm755 ${pkgdir}/usr/share/fonts/OTF/
	install -m644 *.otf ${pkgdir}/usr/share/fonts/OTF/
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
