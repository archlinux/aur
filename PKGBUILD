# Maintainer: Omansh Krishn omansh@duck.com

pkgname=materialious-bin
pkgver=1.6.25
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


source=("${url}/releases/download/${pkgver}/Materialious-${pkgver}-linux-amd64.deb")
sha256sums=('97a60e7f0c151a596f22de05cf7ccc35b056cfa86adc8094ef488acfd4f72ffb')

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
