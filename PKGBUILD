# Maintainer: Faerbit <faerbit at gmail dot com>

pkgname=usbguard-notifier
pkgver=0.1.0
pkgrel=1
pkgdesc="A tool for detecting usbguard policy and device presence changes"
arch=('x86_64')
url="https://github.com/Cropi/usbguard-notifier"
license=('GPL2')
depends=('usbguard' 'libnotify' 'librsvg')
makedepends=('catch2' 'asciidoc')
source=("https://github.com/Cropi/usbguard-notifier/releases/download/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz"{,.asc})
md5sums=('SKIP'
         'SKIP')

validpgpkeys=('42363D1C30A574A4EE5D9C87E650CBBFEF3AAC4B') # alakatos at redhat dot com

build() {
        cd "$srcdir/$pkgname-$pkgver"
        ./configure CPPFLAGS=-I/usr/include/catch2 --prefix=/usr
        make
}

package() {
        cd "$srcdir/$pkgname-$pkgver"
        make DESTDIR="$pkgdir/" install
}
