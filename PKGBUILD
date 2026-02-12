# Maintainer:
# Contributor: mybluevan <mybluevan at gmail dot com>
# Contributor: blx32 <develop at srmoura dot com dot br>

pkgname=mementodb
pkgver=3.9.0
pkgrel=1
pkgdesc='A complex, easy-to-use and customizable solution for database management'
arch=('x86_64')
url='https://mementodatabase.com'
license=('LicenseRef-MementoDBInc')
depends=('alsa-lib' 'glibc' 'java-runtime' 'libx11' 'libxext' 'libxi' 'libxrender' 'libxtst' 'zlib')
options=('!docs' '!strip')
source=("${url}/download/${pkgname}-${pkgver}-linux.deb")
sha256sums=('ea36fc9035256b4f04b791c111f138a1e2d500e4a95dc51e2cba3780317cd7dc')

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm644 "${pkgdir}/opt/${pkgname}/lib/mementodb-mementodb.desktop" -t "${pkgdir}/usr/share/applications"
    install -Dm644 "${pkgdir}/opt/${pkgname}/lib/app/LICENSE" -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
