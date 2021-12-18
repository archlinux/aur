# Maintainer: Daniel Schemp <dschemp@mailbox.org>

pkgname=plymouth-theme-hot-dog
pkgver=0.4
pkgrel=1
pkgdesc="Plymouth Happy Hot Dog Theme"
arch=('any')
url="https://wwoods.fedorapeople.org/hot-dog/"
license=('CC-BY-SA')
source=("https://wwoods.fedorapeople.org/hot-dog/plymouth-theme-hot-dog-${pkgver}.tar.bz2")
sha512sums=('fbf75652e741e7780edfa66242498696f487fc406b8500b094d6693436e63e1f405f081656f86bb84b497823263e719272c798a4a853d4757f034eee710e834f')

depends=('plymouth')
_themename="hot-dog"

package() {
  targetdir="${pkgdir}/usr/share/plymouth/themes/${_themename}"
  install -d -m 0755 "${targetdir}"
  cd "${pkgname}-${pkgver}"
  install -m 0644 "${_themename}.plymouth" *.png "${targetdir}"
  install -Dm 0755 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}
