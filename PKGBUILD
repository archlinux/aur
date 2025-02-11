# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Terin Stock <terinjokes@gmail.com>

pkgname=topgit
pkgver=0.19.14
pkgrel=1
pkgdesc='A different patch queue manager'
url="https://github.com/mackyle/$pkgname"
arch=(any)
license=(GPL-2.0-only)
depends=(bash
         gawk)
_tag="$pkgname-$pkgver"
_archive="$pkgname-$_tag"
source=("$url/archive/$_tag/$_archive.tar.gz")
sha256sums=('0556485ca8ddf0cf863de4da36b11351545aca74fbf71581ffe9f5a5ce0718cb')

package() {
	cd "$_archive"
	make prefix=/usr cmddir=/usr/lib/topgit DESTDIR="$pkgdir" install
	install -Dm0644 contrib/tg-completion.bash "$pkgdir/usr/share/bash-completion/completions/tg"
}
