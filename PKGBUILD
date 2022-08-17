#Maintainer: mybluevan <mybluevan at gmail dot com>
#Contributor: blx32 <develop at srmoura dot com dot br>

pkgname=mementodb
pkgver=1.12.0
pkgrel=1
pkgdesc='A user-friendly database.'
arch=('x86_64')
url='https://mementodatabase.com/'
license=('custom:MementoDB Inc')
source=("https://mementodatabase.com/download/${pkgname}-${pkgver}-x86_64.deb" "LICENSE")
sha256sums=('b279240ed2e100c6c1b50b1af13f6ce5225b8f5aecfd8893cc236f578244bfd3'
            'f976f46272474b7c18862bd7459bde0ac1638def332253a0b71c7d7d98d9e380')
sha512sums=('067e3045b9caf86e44495c7c0f49c2107253294c5e782f915515c85e330e66b9fb27795981f417dea564d7233391de6c23ad3a22e14fbdcf72f94bf29b31a10b'
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
