# Maintainer: LS-Shandong <ls-shandong at outlook dot com>
# Contributor: Ting-Wei Lan <lantw44 at gmail dot com>
# Contributor: Thomas Koller-Cherek <tk120 at protonmail dot com>
# Contributor: holos
# Contributor: tantalum

pkgname=guile-json
pkgver=4.7.3
pkgrel=2
pkgdesc='JSON module for Guile'
arch=('x86_64' 'i686' 'armv7h')
url='https://savannah.nongnu.org/projects/guile-json'
license=('GPL3')
depends=('guile')
source=( https://download-mirror.savannah.nongnu.org/releases/$pkgname/$pkgname-$pkgver.tar.gz{,.sig} )
sha256sums=('38ba048ed29d12f05b32c5b2fb7a51795c448b41e403a2b1b72ff0035817f388'
            '2aa18c8f579e461a89f76c177a030b879fc1e8300b6e2611ea60cf474aa3857d')
validpgpkeys=( 7CEC5511C8D057A9EF17470C54D4CC6FFC7468F4 )
options=(!strip)

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

check(){
  cd "$pkgname-$pkgver"
  make check
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
