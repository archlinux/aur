# Maintainer: WebMast lbhnik12@gmail.com
pkgname=musm
pkgver=1.0
pkgrel=1
pkgdesc="A simple music player with minimal UI"
arch=('x86_64')
url="https://github.com/walmstudio/musm"
license=('GPL')
depends=('mpv' 'ffmpeg')
source=("https://github.com/walmstudio/musm/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('SKIP') # Замените на реальную сумму, если нужно

package() {
  cd "$srcdir/$pkgname-$pkgver"

  if [ -d bin ]; then
    install -dm755 "$pkgdir/usr/bin"
    install -m755 bin/* "$pkgdir/usr/bin/"
  fi

  if [ -d share ]; then
    install -dm755 "$pkgdir/usr/share"
    cp -a share/* "$pkgdir/usr/share/"
  fi

}
