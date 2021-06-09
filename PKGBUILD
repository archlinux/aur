# Maintainer: Fabrizio del Tin <fdt@euniversity.pub>

_pkgname=pgadmin4
pkgname=${_pkgname}-latest
pkgver=latest
pkgrel=0
pkgdesc='Comprehensive design and management interface for PostgreSQL. Self-updating. Opens the server in a terminal and launches the default browser'
url='https://www.pgadmin.org/'
arch=('x86_64')
license=('custom')
replaces=("${_pkgname}")
conflicts=("${_pkgname}" "pgadmin4-last")
provides=("${_pkgname}=${pkgver}")
depends=('postgresql-libs' 'hicolor-icon-theme' 'python' 'python-pip' 'xterm')
makedepends=('imagemagick')
source=('pgadmin4'
	'pgadmin4.desktop'
	'pgadmin4.png')
sha512sums=('1602c069093f2eefe02e8f8796f935daf76095d97b4366354167dc33ae1178ea76f3f8786e9d9b38e2b9aefb6781c0cf8dab0f56a56991dc79693deaf83a796b'
            'cf0a738031ed11456a3f0fd554af76c81a5ecd707c59f4510e80692bc5feb75d9eba7503fe8f73fc8525733fa2c884b02593af113a6f2b8b8edd60735ae5205f'
            '583348ae0786ed948abc8416afd9f10e989b08fd3b6fd357c3d1c42e1235e303656e8d324a11515d19aa8dd60a1cfaf8b50da534eb2456ba777b604f5c580d93')

package() {
  cd ${pkgdir}
  install -Dm 755 "${srcdir}/pgadmin4" -t "${pkgdir}/usr/bin"
  install -dm 755 "${pkgdir}/usr/share/icons/hicolor/"{'256x256/apps','48x48/apps','32x32/apps','16x16/apps'}
  convert "${srcdir}/pgadmin4.png" -resize 256x265 "${pkgdir}/usr/share/icons/hicolor/256x256/apps/pgadmin4.png"
  convert "${srcdir}/pgadmin4.png" -resize 48x48 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/pgadmin4.png"
  convert "${srcdir}/pgadmin4.png" -resize 32x32 "${pkgdir}/usr/share/icons/hicolor/32x32/apps/pgadmin4.png"
  convert "${srcdir}/pgadmin4.png" -resize 16x16 "${pkgdir}/usr/share/icons/hicolor/16x16/apps/pgadmin4.png"
  install -Dm 644 "${srcdir}/pgadmin4.desktop" -t "${pkgdir}/usr/share/applications"
}
