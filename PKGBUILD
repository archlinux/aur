# Maintainer: David Birks <david@tellus.space>
# Contributor: William Grieshaber <me@zee.li>
# Contributor: zertyz <zertyz@gmail.com>

pkgname=pingendo-4-beta
pkgver=2017.10.18
pkgrel=1
pkgdesc="An WYSIWYG HTML5 editor focused on Bootstrap UI"
arch=('i686' 'x86_64')
url="http://pingendo.com"
license=('custom:pingendo')
depends=('nss'
	'libnotify'
	'libxtst'
	'gtk2'
	'gcc-libs-multilib'
	'systemd'
	'alsa-lib'
	'gconf')
optdepends=('libnotify: Adds desktop notifications')
options=('!strip')
conflicts=('pingendo')
makedepends=('unzip')
source_i686=("https://firebasestorage.googleapis.com/v0/b/pingendoauth.appspot.com/o/pingendo.4-0-beta-linux32.zip?alt=media")
source_x86_64=("https://firebasestorage.googleapis.com/v0/b/pingendoauth.appspot.com/o/pingendo.4.0-beta.linux64.zip?alt=media")
source=("pingendo.desktop")
sha512sums_i686=('e85ddbb65c1fcbb034d7a705b5a97a3da7dd49665325fbb8258f8f909a7cc9a36ce1bd2c8754443c01aaec5acbd48d820991bda391640b92a3cd349875783cdb')
sha512sums_x86_64=('75c419e5c4a856bfb88cbd0a585a63f6a867b979890c83d63ce125201ea625fea7ff66d389dc1c19ae012666b34e1309fa72bac7ce0ad1f669c643c982edd94b')
sha512sums=('bee75e729812a1e89ff4503b1dcc7aa016db58acb1821d5dcf5d720a00c18fd387f6d9f815ac1b5276139f61709b78b330bf8abdd0d2c380e87d92677b71c617')

package() {
        mkdir -p "${pkgdir}/opt/"

        if [ "${CARCH}" == 'x86_64' ]; then
          cp -a "${srcdir}/Pingendo-4-linux-x64" "${pkgdir}/opt/${pkgname}"
          install -D -m0644 "${srcdir}/Pingendo-4-linux-x64//LICENSE" "${pkgdir}/usr/share/licenses/pingendo/LICENSE"
        elif [ "${CARCH}" == 'i686' ]; then
          cp -a "${srcdir}/Pingendo-4-linux-ia32" "${pkgdir}/opt/${pkgname}"
          install -D -m0644 "${srcdir}/Pingendo-4-linux-ia32//LICENSE" "${pkgdir}/usr/share/licenses/pingendo/LICENSE"
        fi

        chmod 755 "${pkgdir}/opt/${pkgname}/Pingendo-4"
        install -D -m0644 "${srcdir}/pingendo.desktop" "${pkgdir}/usr/share/applications/pingendo.desktop"
}
