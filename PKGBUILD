# Maintainer: Frederik Schwan <freswa at archlinux dot org>

pkgname=jetbrains-toolbox
pkgver=3.3.0.74186
pkgrel=1
pkgdesc='Manage all your JetBrains Projects and Tools'
arch=('x86_64' 'i686')
url='https://www.jetbrains.com/toolbox/'
license=('custom:jetbrains')
depends=(
  fuse
  glib2
  libxslt
  libxss
  nss
  org.freedesktop.secrets
  xcb-util-keysyms
  xdg-utils
)
optdepends=('xdg-utils: open URLs')
options=('!strip' '!debug')
source=("https://download.jetbrains.com/toolbox/${pkgname}-${pkgver}.tar.gz"
        jetbrains-toolbox.desktop
        icon.svg
        LICENSE)
b2sums=('81e920147b6d935090932b5703fae6bf64a99790eeddb4939366c2639781c98a5126c4ba1be971d1ca0331d2ae4533b79a33705742be28331a27f15b30dfadf3'
        '29b6d4be91d9276bce9e5413fb877db82de414198e343ff3f7aa5d03f65cf42c80f78ec3b43f601394fecc6a31712d1c475f3fdec71e51be5732ec7b1eb8dca9'
        '4b10487746fcb7f328cbdc8b17432f82618c5695baee4ef30e23ff3c4d4b6096daf2fcdfb4c1e2e179e2e61f68bbd88104e5df5a2e6e969aad0a68a75cfff496'
        'dadaf0e67b598aa7a7a4bf8644943a7ee8ebf4412abb17cd307f5989e36caf9d0db529a0e717a9df5d9537b10c4b13e814b955ada6f0d445913c812b63804e77')

package() {
  install -dm755 "${pkgdir}"/usr/bin/ "${pkgdir}"/opt/${pkgname}
  install -Dm644 "${srcdir}"/${pkgname}.desktop "${pkgdir}"/usr/share/applications/${pkgname}.desktop
  install -Dm644 "${srcdir}"/icon.svg "${pkgdir}"/usr/share/pixmaps/${pkgname}.svg
  install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE.txt

  cp -ar "${srcdir}"/${pkgname}-${pkgver}/bin/* "${pkgdir}"/opt/${pkgname}/

  ln -s /opt/${pkgname}/${pkgname} "${pkgdir}"/usr/bin/${pkgname}
}
