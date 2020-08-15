#Maintainer: MementoDB Inc

pkgname=mementodb
pkgver=1.8.4
pkgrel=1
pkgdesc='A user-friendly database.'
arch=('x86_64')
url='https://mementodatabase.com/'
license=('Custom:MementoDB Inc')
source=("https://mementodatabase.com/download/${pkgname}-${pkgver}-x86_64.deb" "copyright")
sha256sums=('f4ec321b1c41371489a459f60993ffc66dfeb6da8721088efda98d2853287812'
            '1c0bcd640026cb8a6baf15cdf9c037223b2da364eddf868022219b574663460e')


build() {

  ar -x ${srcdir}/${pkgname}-${pkgver}-x86_64.deb
  tar -xJf ${srcdir}/data.tar.xz

}

package() {
    install -d "${pkgdir}/opt/"
    cp -r "${srcdir}/opt/${pkgname}" "${pkgdir}/opt/"
    install -Dm644 "${srcdir}/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 copyright "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
