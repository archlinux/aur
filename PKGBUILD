# Maintainer: 
# Contributor: Mark Wagie <mark dot wagie at proton dot me>
pkgname=uresourced
pkgver=0.5.4
pkgrel=1
pkgdesc="Dynamically allocate resources to the active user"
arch=('x86_64')
url="https://gitlab.freedesktop.org/benzea/uresourced"
license=('LGPL-2.1-or-later')
depends=('glib2' 'systemd-libs')
makedepends=('meson' 'libpipewire' 'systemd')
backup=("etc/$pkgname.conf")
install="$pkgname.install"
source=("$url/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha256sums=('c14b5dadde4e5a24fbf41c66b03bc759ce68cb1cf372c231841b0f52104d4f46')

build() {
  arch-meson "$pkgname-v$pkgver" build -Dappmanagement='true'
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
