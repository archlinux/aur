# Maintainer: Mehmet Efe Kuzu (Mefkuz) <mefkuz@mefkuz.com>
pkgname=scholarflow
pkgver=1.0.0
pkgrel=1
pkgdesc="Google Gemini destekli, modern tasarımlı akademik asistan ve üretkenlik paketi."
arch=('any')
url="https://scholarflow.mefkuz.com/"
license=('MIT')
depends=('nodejs' 'npm')
makedepends=('git')
source=("git+https://github.com/mefkuz/ScholarFlow.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/ScholarFlow"
  npm install
  npm run build
}

package() {
  cd "$srcdir/ScholarFlow"
  # Build dosyalarını sistem dizinine kopyalar
  install -d "$pkgdir/usr/share/webapps/$pkgname"
  cp -r dist/* "$pkgdir/usr/share/webapps/$pkgname/"
}
