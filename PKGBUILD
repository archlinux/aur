# Maintainer: éclairevoyant

pkgname=ly2video
pkgver=0.5.0
pkgrel=1
pkgdesc="Generate videos from Lilypond sheet music files"
arch=(any)
url="https://github.com/aspiers/$pkgname"
license=(GPL3)
depends=(ffmpeg lilypond python-mido python-pexpect python-pillow timidity++)
makedepends=(python-setuptools)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('7d5c01f32d8a92fbe19fc76a3e176814361ac029203d2cf06df5a64747aea5b4dfa5dc8a966b0804ca578f36c56c53d2693fc64d015cdea3bf3b5c35a4d2b557')

build() {
	cd $pkgname-$pkgver
	python setup.py build
}

package() {
	cd $pkgname-$pkgver
	python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
