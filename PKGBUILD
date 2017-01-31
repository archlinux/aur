pkgname=swiss-army-scrot
pkgver=1.0.0
pkgrel=2
pkgdesc='Simple screenshot utility that integrates nicely into i3 and XFCE.'
url=https://gitla.in/flisk/swiss-army-scrot
arch=('any')
license=('MIT')
depends=('xclip' 'scrot')
optdepends=('libnotify: desktop notifications when you take screenshots')

package() {
  cd ..
  install -D ./swiss-army-scrot.sh "${pkgdir}/usr/libexec/swiss-army-scrot.sh"
  install -D ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  mkdir -p "${pkgdir}/usr/bin"

  ln -s /usr/libexec/swiss-army-scrot.sh "${pkgdir}/usr/bin/copy-screen"
  ln -s /usr/libexec/swiss-army-scrot.sh "${pkgdir}/usr/bin/copy-window"
  ln -s /usr/libexec/swiss-army-scrot.sh "${pkgdir}/usr/bin/save-screen"
  ln -s /usr/libexec/swiss-army-scrot.sh "${pkgdir}/usr/bin/save-window"
}
