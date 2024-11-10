# Maintainer: Omansh Krishn omansh@duck.com

pkgname=materialious-bin
pkgver=1.6.22
pkgrel=1
pkgdesc='Modern material design for Invidious'
arch=('x86_64')
url='https://github.com/Materialious/Materialious'
license=('AGPL3')
makedepends=( libarchive )
depends=('at-spi2-core' 'gtk3' 'libnotify' 'libsecret' 'libxss' 'libxtst' 'nss' 'util-linux-libs' 'xdg-utils' )
optdepends=( libappindicator-gtk3 )
provides=('materialious')
conflicts=('materialious-git')
options=(!debug)


source=("${url}/releases/download/v${pkgver}/Materialious-${pkgver}-linux-amd64.deb")

sha512sums=('5b2130b53dc582999d75068927fb9eaf97a47b2de15befc10d48a7a27814fdee32cf9a76f875fa123695823a554ec83f4064e1193c8614c796c0996223040111')

package() {

  cd "${srcdir}"
  bsdtar -xf "${srcdir}/data.tar.xz"
  install -dm755 "${pkgdir}/opt"
  cp --preserve=mode -r 'opt' "${pkgdir}/"

	install -dm755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  install -m644 "${srcdir}/usr/share/icons/hicolor/512x512/apps/materialious.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/materialious.png"

  install -dm755 "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/usr/share/applications/materialious.desktop" "${pkgdir}/usr/share/applications/materialious.desktop"

}
