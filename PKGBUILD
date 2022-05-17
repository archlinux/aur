#Maintainer: mybluevan <mybluevan at gmail dot com>
#Contributor: blx32 <develop at srmoura dot com dot br>

pkgname=mementodb
pkgver=1.11.1
pkgrel=1
pkgdesc='A user-friendly database.'
arch=('x86_64')
url='https://mementodatabase.com/'
license=('custom:MementoDB Inc')
source=("https://mementodatabase.com/download/${pkgname}-${pkgver}-x86_64.deb" "LICENSE")
sha256sums=('45cbbdec1ae283fc2375d4641f3314102cca2e1ad6d89f6ccb412d7abbfa7771'
            'f976f46272474b7c18862bd7459bde0ac1638def332253a0b71c7d7d98d9e380')
sha512sums=('a64573265978372c89f0757f5e4fb9c515b58e004cbd7af0fb4eb28d218d7d2560e0b6515397a55e6c3e268f059260379cf8ec61dc1761fc701722845baad562'
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
