# Contributor: josip <josip@jjanzic.com>
pkgname=wl-clipboard-history-git
pkgver=r3.2c57075
pkgrel=1
pkgdesc="Wayland clipboard history tracker based on wl-clipboard"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'arm' 'aarch64')
url="https://github.com/janza/wl-clipboard-history"
license=('MIT')
depends=('wl-clipboard' 'sqlite>=3.0')
source=("${pkgname%-*}::git+https://github.com/janza/wl-clipboard-history.git")
sha1sums=("SKIP")

pkgver() {
    cd "$srcdir/${pkgname%-*}" || exit 1
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package ()
{
  cd "$srcdir/${pkgname%-*}" || exit 1
  mkdir -p "$pkgdir"/usr/bin/
  cp "wl-clipboard-history" "$pkgdir"/usr/bin/
}
