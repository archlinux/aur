# Maintainer: tjbp (archlinux@tjbp.net)

pkgname=itsa
pkgver=004
pkgrel=1
pkgdesc='itsa is a program for interacting with the UK’s HMRC Make Tax Digital APIs'
arch=('x86_64' 'i686')
url='https://github.com/ac000/itsa'
license=('GPL-2.0-only')
depends=('sqlite' 'libac' 'libmtdac')
install='config.install'
source=("https://github.com/ac000/itsa/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d50a252c6d752bf9039a0dd4a4bf256d59e0f41824c51c5fce1d3fd15b0659b1')

build() {
    cd itsa-$pkgver
    make
}

package() {
    cd itsa-$pkgver

    install -Dp -m0755 src/itsa $pkgdir/usr/bin/itsa
    install -Dp -m0644 config.json.tmpl $pkgdir/usr/share/itsa/config.json.tmpl
}
