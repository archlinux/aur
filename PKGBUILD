# Maintainer: SelfRef <arch@selfref.dev>

_basename=lilipod
pkgname=${_basename}
pkgver=0.0.3
pkgrel=2
pkgdesc="Lilipod is a simple container manager, able to download, unpack and use OCI images from various container registries (stable version)"
arch=('any')
url="https://github.com/89luca89/lilipod"
license=('GPL-3.0')
makedepends=('git' 'go')
source=("$_basename::git+https://github.com/89luca89/lilipod.git#tag=v$pkgver")
sha256sums=('5067b40bd4bf3698dbfbdd23b63500027973123ed3861b118d01458d193f1b6d')

build() {
	cd "$_basename"
	make pty
	make lilipod
}

package() {
	cd "$_basename"
	install -Dm755 lilipod "$pkgdir"/usr/bin/lilipod
}
