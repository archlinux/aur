# Maintainer: weearc <qby19981121@gmail.com>

pkgname=purple-oicq
pkgver=1.0.2
pkgrel=0
pkgdesc='A libpurple plugin'
url='https://github.com/axon-oicq/purple-oicq'
license=(Unlicense)
arch=(any)
depends=('libpurple'
         'json-glib')
makedepends=('make' 'gcc' 'libtool' 'pkg-config')
optdepends=('pidgin: GUI frontend for libpurple and purple-oicq'
            'finch: TUI frontend for libpurple and purple-oicq'
            'libaxon-bin: Nodejs backend for purple-oicq, with service support'
	    'libaxon: Nodejs backend for purple-oicq')
source=("https://github.com/axon-oicq/purple-oicq/archive/v1.0.2.tar.gz")
sha256sums=('acb397df6e2e5efaa1c625beb33422853d91566deb71285e8defef98cc7c710a')
conflicts=('purple-oicq-git')

build() {
  cd ${srcdir}
  cd $pkgname-$pkgver
  make
}

package() {
  install -d ${pkgdir}/usr/lib/purple-2
  install -Dm644 ${srcdir}/$pkgname-$pkgver/libpurple-oicq.so ${pkgdir}/usr/lib/purple-2/libpurple-oicq.so
}
