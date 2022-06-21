# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=epoch-bin
pkgver=0.2.1
pkgrel=1
pkgdesc="The Epoch IDE for Lingua Franca"
arch=('x86_64')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'python' 'nodejs' 'lib32-gcc-libs' 'perl')

source=("https://github.com/lf-lang/lingua-franca/releases/download/v${pkgver}/epoch_ide_${pkgver}-linux.gtk.x86_64.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/lingua-franca/v${pkgver}/LICENSE")
sha512sums=('661cc8efb18e7a65bfa83ea104e05255e3b077b185c2d36bf181e2a1e74faa4fca8f8b6df640d7fca7832878cda906ccca3cd1358568ee2e545fd6aa0b4fe4ee'
            '3b445e4c24bc0514043db597e02924c96917f55519db65f7a044e70c8905cb57387269437fb1648893ce68da6e2894eb3cc0a8c5de8944044c9513ae5fb89c8c')

package() {
  install -dm755 "${pkgdir}/opt/lf"
  cp -r "${srcdir}/epoch" "${pkgdir}/opt/lf"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/lf/epoch/epoch" "${pkgdir}/usr/bin/epoch"
  install -Dm644 "${startdir}/epoch.desktop" "${pkgdir}/usr/share/applications/epoch.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/epoch-bin/LICENSE"
}
