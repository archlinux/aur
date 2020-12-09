#Maintainer: MementoDB Inc

pkgname=mementodb
pkgver=1.9.6
pkgrel=1
pkgdesc='A user-friendly database.'
arch=('x86_64')
url='https://mementodatabase.com/'
license=('custom:MementoDB Inc')
source=("https://mementodatabase.com/download/${pkgname}-${pkgver}-x86_64.deb" "LICENSE")
sha256sums=('e9ceccae7ef47b8951bbc1992db5ec56dd8862ba5c508b9464656600bf09095c'
            'f976f46272474b7c18862bd7459bde0ac1638def332253a0b71c7d7d98d9e380')
sha512sums=('d0a591ef680bd65d43e1bedb3301e001a60962fcd31cd9840af2142713fff49cccd6674772728707ead1d1236c46169de6737831e1b10ceddc07ab445031e3c1'
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
