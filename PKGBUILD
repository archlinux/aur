# Maintainer: Christian Menard <christian.menard@tu-dresden.de>

pkgname=epoch-bin
pkgver=0.3.0
pkgrel=1
pkgdesc="The Epoch IDE for Lingua Franca"
arch=('x86_64')
url="https://lf-lang.org"
license=('BSD')
depends=('java-runtime=17' 'python' 'nodejs' 'perl')

source=("https://github.com/lf-lang/lingua-franca/releases/download/v${pkgver}/epoch_ide_${pkgver}-linux.gtk.x86_64.tar.gz"
        "https://raw.githubusercontent.com/lf-lang/lingua-franca/v${pkgver}/LICENSE")
sha512sums=('fde074b24e039d03beaf1dfa7fdf1cc1f79884b991d9226fa5a6fdbf6084db85baf1329259a8279e737350cde04b807a7e1baf069d5c47746c51ef1b16c8de46'
            '3b445e4c24bc0514043db597e02924c96917f55519db65f7a044e70c8905cb57387269437fb1648893ce68da6e2894eb3cc0a8c5de8944044c9513ae5fb89c8c')

package() {
  install -dm755 "${pkgdir}/opt/lf"
  cp -r "${srcdir}/epoch" "${pkgdir}/opt/lf"
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/lf/epoch/epoch" "${pkgdir}/usr/bin/epoch"
  install -Dm644 "${startdir}/epoch.desktop" "${pkgdir}/usr/share/applications/epoch.desktop"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/epoch-bin/LICENSE"
}
