# Maintainer: Frederik Leonhardt <frederik at leonhardt dot co dot nz>
pkgname=lsetwatch
pkgver=1.20
pkgrel=1
pkgdesc="LEGO collection management software"
arch=('x86_64')
url="https://lebostein.de/lsetwatch/index.html"
license=('custom')
depends=('wine')
source=("$pkgname-$pkgver.zip::https://lebostein.de/lsetwatch/builds/Lsetwatch_${pkgver}_Windows_x64.zip"
        "$pkgname.sh"
        "$pkgname.desktop"
        "icon.png"
)
sha256sums=('1f1f633e27d563ef409a3a735710fcb0586b7346b926e9a9d4cbd3ab987c89b6'
            'dd8ab5252c38b28cb8c8f75cc6a053c049d0c0604ddab9fb740c3cd2739c91bc'
            '930b1b12b6039c309aa3e3258f0b62ae8e496c67d5f7e054cce8a5d798c07131'
            '135ea5add0a8ffc9249e0e6ca1430992e31127f2e13757ec82fe6ed6cc73050f')

package() {
  install -Dd "$pkgdir/usr/share/$pkgname"
  cp -r "$srcdir/Lsetwatch"/* "$pkgdir/usr/share/$pkgname"

  install -Dm755 "$srcdir/$pkgname.sh" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png"
}

