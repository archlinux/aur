# Maintainer: Daniel Landau <daniel@landau.fi>
# Contributor: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=otf-futura-renner
pkgdesc="A digital version of Futura"
url='https://fontlibrary.org/en/font/futura-renner'
license=('custom:SIL Open Font License')
pkgver=1
pkgrel=2
depends=('fontconfig' 'xorg-font-utils' 'fontforge')
arch=('any')
install=$pkgname.install

source=(https://fontlibrary.org/assets/downloads/futura-renner/951a69f210c7e73b8d89c27bcd07320a/futura-renner.zip)
sha512sums=('7f4f9a8299364778357cec0cb76dd40ece3c137c477e38259d95d7ac07caa2b34f8f0cbe807445d6a9f8a0dd362eca542b9753c22839a517137a3d142dd21a97')

package() {
  install -d "${pkgdir}/usr/share/fonts/OTF"

  cd "${srcdir}/FuturaRenner-master/fonts"

  install -m644 *.otf "${pkgdir}/usr/share/fonts/OTF/"
  install -d "${pkgdir}/usr/share/fonts/TTF"
  cd webfonts
  install -m644 *.ttf "${pkgdir}/usr/share/fonts/TTF/"

  install -D -m644 "${srcdir}/FuturaRenner-master/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
