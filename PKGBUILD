# Maintainer: Nie(sha) <nieein56@tamag.org>

pkgname="brother-dcpj577n"
pkgver="1.0.5"
pkgrel="0"
pkgdesc="Brother DCP-J577N CUPS driver"
url="http://brother.co.jp/"
license=('EULA')
install="brother-dcpj577n.install"
depends=('cups' 'a2ps')
arch=('i686' 'x86_64')

md5sums=(
  '0123659bafc46e84ca66316dc511f0f8'
  '23c3134e53d7a38778ba8b0fe2e93d64'
)

source=(
  'fix_lp.patch' \
  "https://download.brother.com/welcome/dlf104037/dcpj577npdrv-$pkgver-$pkgrel.i386.rpm"
)

build() {
  cd "$srcdir"
  patch -Np0 < fix_lp.patch
}

package() {
  install -d "$pkgdir"/usr/bin
  install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj577n "$pkgdir"/usr/bin/
  cp -R "$srcdir"/opt "$pkgdir"/opt
}

