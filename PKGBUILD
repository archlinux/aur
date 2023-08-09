# Maintainer: Jose Riha <jose 1711 gmail com>

pkgname=qrlogo-git
pkgver=20180913
pkgrel=2
pkgdesc="Pure JavaScript implementation of QR encoder/decoder"
arch=('any')
url="https://github.com/kaarposoft/qrlogo"
makedepends=('git')
license=('Apache')
source=('git+https://github.com/kaarposoft/qrlogo.git')
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

package() {
  cd ${pkgname%-git}
  install -dm755 "${pkgdir}/usr/share/qrlogo-git"
  install -Dm644 *.html "${pkgdir}/usr/share/qrlogo-git/"
  install -Dm644 *.js "${pkgdir}/usr/share/qrlogo-git/"
  install -Dm644 *.ico "${pkgdir}/usr/share/qrlogo-git/"
  install -Dm644 *.css "${pkgdir}/usr/share/qrlogo-git/"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/qrlogo-git/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/qrlogo-git/README.md"
}

