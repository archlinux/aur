# Maintainer: Mehmet Efe Kuzu (Mefkuz) <mefkuz@mefkuz.com>
pkgname=scholarflow
pkgver=1.1.0
pkgrel=1
pkgdesc="Google Gemini destekli, modern tasarımlı akademik asistan (GUI Sürümü)"
arch=('any')
url="https://scholarflow.mefkuz.com/"
license=('MIT')
depends=('nodejs' 'npm' 'python-pywebview')
makedepends=('git')
source=("git+https://github.com/mefkuz/ScholarFlow.git"
        "scholarflow-gui"
        "scholarflow.desktop")
md5sums=('SKIP' 'SKIP' 'SKIP')
install="$pkgname.install"

package() {
  cd "$srcdir/ScholarFlow"
  
  # Web dosyaları
  install -d "$pkgdir/usr/share/webapps/$pkgname"
  cp -r dist/* "$pkgdir/usr/share/webapps/$pkgname/"
  
  # GUI Başlatıcı ve Kısayol
  install -Dm755 "$srcdir/scholarflow-gui" "$pkgdir/usr/bin/scholarflow-gui"
  install -Dm644 "$srcdir/scholarflow.desktop" "$pkgdir/usr/share/applications/scholarflow.desktop"
}
