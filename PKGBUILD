# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=epoch-bin
pkgver=0.2.0
pkgrel=2
pkgdesc="The Epoch IDE for Lingua Franca"
arch=('any')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'python' 'nodejs' 'lib32-gcc-libs' 'perl')

source=("https://github.com/lf-lang/lingua-franca/releases/download/v${pkgver}/epoch_ide_${pkgver}-linux.gtk.x86_64.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/lingua-franca/v${pkgver}/LICENSE")
sha512sums=('533be1a26e2003cb845d732d2a7e6a6d5881bc71de056d1e8d07cf25e3aa5fe8d3c775b83cff1c1b38c3425554b8878cb2b4f3aa5a0152201493c8f020ec70a6'
            '3b445e4c24bc0514043db597e02924c96917f55519db65f7a044e70c8905cb57387269437fb1648893ce68da6e2894eb3cc0a8c5de8944044c9513ae5fb89c8c')

package() {
  install -dm755 "${pkgdir}/opt/lf"
  cp -r "${srcdir}/epoch" "${pkgdir}/opt/lf"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/lf/epoch/epoch" "${pkgdir}/usr/bin/epoch"
  install -Dm644 "${startdir}/epoch.desktop" "${pkgdir}/usr/share/applications/epoch.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/epoch-bin/LICENSE"
}
