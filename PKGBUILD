# Maintainer: Iru Cai <https://vimacs.wehack.space>
# Contributor: Iru Cai <https://vimacs.wehack.space>

pkgname=rsstail-go
pkgver=1.0
pkgrel=1
pkgdesc='A functional subset of rsstail implemented in Go'
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url='https://gitea.com/vimacs/rsstail-go'
license=('MIT')
source=("rsstail-go-$pkgver.tar.xz::https://gitea.com/attachments/edaa6e02-4901-4908-825c-456260b0d525")
sha256sums=('b27d8728aa71d6415d259cc8ac20ecf45cb2b5c589e656fef058fc893fde1105')
makedepends=(go)
conflicts=(rsstail)

build() {
	cd "$pkgname"
	go build -trimpath
}

package() {
	cd "$pkgname"
	install -D -m755 rsstail "$pkgdir/usr/bin/rsstail"
}
