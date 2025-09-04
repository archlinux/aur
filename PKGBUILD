# Maintainer: Leonie Ain <me@koyu.space>
pkgname=rdr
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to simply read Markdown files without the hassle."
arch=('x86_64')
url="https://github.com/koyuawsmbrtn/rdr"
license=('GPL3')
depends=('vala' 'webkit2gtk' 'cmark' 'glib2')
makedepends=('make')
source=("git+https://github.com/koyuawsmbrtn/rdr.git")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/rdr"
  git checkout v$pkgver
}

build() {
  cd "$srcdir/rdr"
  make
}

package() {
  cd "$srcdir/rdr"
  install -Dm755 rdr "$pkgdir/usr/bin/rdr"
  install -Dm644 style.css "$pkgdir/usr/share/rdr/style.css"
  install -Dm644 resources.xml "$pkgdir/usr/share/rdr/resources.xml"
}
