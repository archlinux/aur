# Contributor: sinkuu <sinkuupump@gmail.com>

pkgname=uclogic-tools
pkgver=5
pkgrel=1
pkgdesc="Show diagnostic information from UC-Logic graphics tablets (rebranded as Huion, Yiynova, Ugee, Monoprice, Turcom and others)"
arch=('i686' 'x86_64')
url="https://github.com/DIGImend/uclogic-tools"
license=('GPL2')
depends=('libusb')
source=("https://github.com/DIGImend/uclogic-tools/releases/download/v$pkgver/uclogic-tools-$pkgver.tar.gz")
sha256sums=('9d7fa39a23600d3946128acf59147d5412b196c8a57a9e3ad4290ac5a71238db')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  # make install puts files in /usr/local/
  install -D uclogic-probe uclogic-decode --target-directory "$pkgdir/usr/bin"
  install -D -m 644 README.md --target-directory "$pkgdir/usr/share/doc/uclogic-tools"
}
