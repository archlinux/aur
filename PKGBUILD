pkgname=tamzen-font
pkgver=1.11
pkgrel=2
pkgdesc='Programmatic fork of the Tamsyn monospace font.'
arch=('any')
url="https://github.com/sunaku/${pkgname}"
license=('custom')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install="${pkgname}.install"
source=("https://github.com/sunaku/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('997e9dd2eaf647bddb72eced541ed9d65e2fc5d1883caaf811331fdd43fc82ec')

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -d "${pkgdir}/usr/share/fonts/misc"
  install -m644 *.bdf "${pkgdir}/usr/share/fonts/misc/"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
