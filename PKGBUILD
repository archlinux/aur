# Maintainer: William Grieshaber <me@zee.li>
# Contributor: zertyz <zertyz@gmail.com>

pkgname=pingendo-4-beta
pkgver=0.33.1
pkgrel=3
pkgdesc="An WYSIWYG HTML5 editor focused on Bootstrap UI"
arch=('i686' 'x86_64')
url="http://pingendo.com/v4-beta/"
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
source_i686=("http://download.pingendo.com/beta/${pkgname}-linux32.zip")
source_x86_64=("http://download.pingendo.com/beta/${pkgname}-linux64.zip")
source=("pingendo.desktop")
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

md5sums=('ebad119798058a009ad4f041d04a174b')
md5sums_i686=('2f1a1f54ecd7389da6107bab3c82b186')
md5sums_x86_64=('4b847b4d905d381d6fbb3131c590d273')
md5sums=('ab99d85ff46b876db76d0a13f5a59c6d')
md5sums_i686=('2f1a1f54ecd7389da6107bab3c82b186')
md5sums_x86_64=('4b847b4d905d381d6fbb3131c590d273')
