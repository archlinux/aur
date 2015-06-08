#Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=smileol
pkgver=latest
[ "${_build}" = "" ] &&  pkgver="$(curl -sL http://dl.dropbox.com/u/41095274/SmilEOL/version)"
pkgrel=2
pkgdesc="Smiles Eolianos para clientes Jabber"
arch=('any')
url="http://elotrolado.net"
license=('GPL')
optdepends=('psi: A client for Jabber IM'
            'psi-plus: A client for Jabber IM'
            'gajim: A client for Jabber IM'
            'pidgin: A client for Jabber IM')
source=('http://dl.dropbox.com/u/41095274/SmilEOL/smileol.jisp')
md5sums=("$(curl -sL http://dl.dropbox.com/u/41095274/SmilEOL/smileol.jisp.md5 | cut -d " " -f1)")
noextract=("smileol.jisp")

build() {
  cd "${srcdir}"
  bsdtar -xf smileol.jisp
}

package() {
  cd "${srcdir}"
  install -Dm644 smileol.jisp "${pkgdir}/usr/share/psi/iconsets/emoticons/smileol.jisp"
  install -Dm644 smileol.jisp "${pkgdir}/usr/share/psi-plus/iconsets/emoticons/smileol.jisp"
  install -d "${pkgdir}/usr/share/gajim/data/emoticons/smileol"
  install -Dm644 smileol/* "${pkgdir}/usr/share/gajim/data/emoticons/smileol/"
  install -d "${pkgdir}/usr/share/pixmaps/pidgin/emotes/smileol"
  install -Dm644 smileol/* "${pkgdir}/usr/share/pixmaps/pidgin/emotes/smileol"
}