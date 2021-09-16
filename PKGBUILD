#Maintainer: mybluevan <mybluevan at gmail dot com>
#Contributor: blx32 <develop at srmoura dot com dot br>

pkgname=mementodb
pkgver=1.10.1
pkgrel=1
pkgdesc='A user-friendly database.'
arch=('x86_64')
url='https://mementodatabase.com/'
license=('custom:MementoDB Inc')
source=("https://mementodatabase.com/download/${pkgname}-${pkgver}-x86_64.deb" "LICENSE")
sha256sums=('8833c52d7238ea31a685acd72937fe58b890b3bb1c2a6769983e8532e0109b69'
            'f976f46272474b7c18862bd7459bde0ac1638def332253a0b71c7d7d98d9e380')
sha512sums=('1edc7d68b3a4cb311860e11d1d9bcaabce9468100d99d07cc2ca2eb1a2d46fa26021f934a9724de574ce71d6899fdf03232db6dd6ed5bce23661ff441dc7158e'
            '3479ecc5eacfe1fbac842004facdf3d2a9813d9a155971ddfd29328f57b6ca919c8337e21d6735d67de60896480de666d6994dbc65990ebdb076a9f88dfe2f59')


build() {

  ar -x ${srcdir}/${pkgname}-${pkgver}-x86_64.deb
  tar -xJf ${srcdir}/data.tar.xz

}

package() {
    install -d "${pkgdir}/opt/"
    cp -r "${srcdir}/opt/${pkgname}" "${pkgdir}/opt/"
    install -Dm644 "${srcdir}/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 ${srcdir}/LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
