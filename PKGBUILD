# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=epoch-bin
pkgver=0.5.0
pkgrel=1
pkgdesc="The Epoch IDE for Lingua Franca"
arch=('x86_64')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'python' 'nodejs' 'perl')

source=("https://github.com/lf-lang/epoch/releases/download/v${pkgver}/epoch_ide_${pkgver}-linux.gtk.x86_64.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/epoch/v${pkgver}/LICENSE")
sha512sums=('399af08ffbc1eb5ed7e95a31eca7f744658dbc1ec380affdb5dbc3fe1b116e288621bd7fcdd343de09fcfebbde9e66445a7517153e2b812f8be85d368e6fba02'
            '477af45f047a9c7735385ecae2a7c34f4b009481c2f5ce7efbe7251f59ad979fd3e8303c4079b2455a05502654a28f3aa33c6754e3d004f2e9117515c24eeb50')

package() {
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/epoch/LICENSE"

  install -dm755 "${pkgdir}/usr/share/java/epoch"
  cp -r "${srcdir}/epoch" "${pkgdir}/usr/share/java"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/usr/share/java/epoch/epoch" "${pkgdir}/usr/bin/epoch"
  install -Dm644 "${startdir}/epoch.desktop" "${pkgdir}/usr/share/applications/epoch.desktop"
}
