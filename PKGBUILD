# Maintainer: tommis <tommi@saira.fi>

pkgname=dragit-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='Application for intuitive file sharing between devices.'
arch=('x86_64')
provides=('dragit')
conflicts=('dragit' 'dragit-git')
depends=('gtk3')
url='https://github.com/sireliah/dragit'
license=('GPL3')
source=("https://github.com/sireliah/dragit/releases/download/v${pkgver}/dragit_v${pkgver}_linux_amd_64.tar.gz"
	'https://raw.githubusercontent.com/sireliah/dragit/master/static/logo_icon_t_256x256.png'
	'https://raw.githubusercontent.com/sireliah/dragit/master/dragit.desktop')
sha256sums=('e58c6d7a1d2b1067a84b4aa0b225433f06c1f73f2c3765f20d3275bf5d10f4c8'
            '54339ace4f9eb1644c5889c46102c68eb8865cc2440e7677d37f3d6908f6e75d'
            '71d300ba9425f6cbdf2beefc7c796280a8105752bc1488ed121c17d895536960')


package() {
  install -D -m 755 "dragit/dragit" \
	  "${pkgdir}/usr/bin/dragit"

  install -D -m 644 dragit.desktop \
	  "${pkgdir}/usr/share/applications/dragit.desktop"
  install -D -m 644 logo_icon_t_256x256.png \
	  "${pkgdir}/usr/share/icons/hicolor/256x256/apps/com.sireliah.Dragit.png"
}
