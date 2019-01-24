# Contributor: Artem A. Klevtsov <unikum.pm@gmail.com>

pkgname=kpdftool
pkgver=0.23.1
pkgrel=3
pkgdesc="GUI interface for GhostView and ImageMagick for operations with PDF and PostScript"
arch=('i686' 'x86_64')
url='http://kde-apps.org/content/show.php/kpdftool?content=33194'
license=('gpl3')
depends=('qt4')
source=(
https://dl.opendesktop.org/api/files/download/id/1466629460/s/4f1715b027513b463172878d22119af8301f7786f94dae595a787533337d9628106a8d9236d32f2f7460ac496ea321c9aa6b7d2f102c7a48d31e4b5d051f65ee/t/1548356291/u//33194-kpdftool-${pkgver}.zip
)
sha512sums=('70b54a1aff225b7492c5bcee8fd3132596047c71ee9baf7284feddd2b8ed10444b2418b2fa8f6bbdc84016c2280f9a6c327703a692ff1abcf32b8005713f3718')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  qmake-qt4
  make
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
}

