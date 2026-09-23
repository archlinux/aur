# Maintainer: Began Bajrami <begbaj@proton.me>
pkgname=beets-ytimport
pkgdesc='A beets plugin to import music from Youtube and SoundCloud'
pkgver=1.13.0
pkgrel=1
url=https://github.com/mgoltzsche/beets-ytimport
arch=(any)
license=(Apache-2.0)
depends=(beets yt-dlp python-ytmusicapi python-requests python-confuse python-mediafile)
makedepends=(python-build python-installer python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('ac751b7f9e7dadabb56fe377f0fb4f0ba19d5bdd3a657feb97a925940eb375439875c592a54961f21fe329b8fdb3ef5fe8000621733b548b015707f0f8ed4984')

build() {
	cd "$pkgname-$pkgver"
	python -m build --wheel --no-isolation
}

package() {
	cd "$pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
