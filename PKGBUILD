# Maintainer: tommis <tommi@saira.fi>

pkgname=dragit
pkgver=0.6.1
pkgrel=1
pkgdesc='Application for intuitive file sharing between devices.'
arch=('any')
conflicts=("${pkgname}-git")
provides=("${pkgname}")
depends=('gtk3')
makedepends=('cargo' 'git' 'rust')
url='https://github.com/sireliah/dragit'
license=('GPL3')
source=('https://github.com/sireliah/dragit/releases/download/v0.6.1/dragit_v0.6.1_linux_amd_64.tar.gz'
	'https://raw.githubusercontent.com/sireliah/dragit/master/static/logo_icon_t_256x256.png'
	'https://raw.githubusercontent.com/sireliah/dragit/master/dragit.desktop')
sha256sums=('7f447ff7d8f5f6b1348590741066f5f70c1aa7d1a05666bba1d5d5d5d98953db'
	    '54339ace4f9eb1644c5889c46102c68eb8865cc2440e7677d37f3d6908f6e75d'
	    '71d300ba9425f6cbdf2beefc7c796280a8105752bc1488ed121c17d895536960')


package() {
  install -D -m 755 "dragit/dragit" \
	  "${pkgdir}/usr/bin/${pkgname}"

  install -D -m 644 dragit.desktop \
	  "${pkgdir}/usr/share/applications/dragit.desktop"
  install -D -m 644 logo_icon_t_256x256.png \
	  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.sireliah.Dragit.png"
}
