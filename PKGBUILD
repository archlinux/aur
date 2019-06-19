# Maintainer: Marcel Robitaille <mail at marcelrobitaille dot me>
# Maintainer (upstream):  Nate Levesque <public at thenaterhood dot com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Matej Horváth <matej.horvath@gmail.com>

pkgname=gscreenshot-simd
pkgver=2.10.1
pkgrel=1
epoch=
pkgdesc="A simple screenshot tool supporting multiple backends (fork using python-pillow-simd)"
arch=('any')
url="https://github.com/thenaterhood/gscreenshot"
license=('GPL')
groups=()
depends=("python"
	"python-pillow-simd"
	"scrot"
	"pygtk"
	"gtk3"
	"python-setuptools"
	"python-gobject")
makedepends=("fakeroot")
checkdepends=()
optdepends=('slop: improved region and window selection'
	'xclip: command line clipboard support'
	'xdg-utils: for opening screenshot files from gscreenshot')
provides=('gscreenshot')
conflicts=('gscreenshot')
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/thenaterhood/gscreenshot/archive/v$pkgver.tar.gz" 'setup.py.patch')
sha256sums=('0cbc20700cc02854624b4745e87fe8f68f48b5b8b629b169df02514e7149d6b3'
            '5f9fb71c32a76f2e93c3403c7f6c081ed8ee0dd3cf1b81eeeebc85ec926a2e32')
validpgpkeys=()

prepare() {
	cd $srcdir/gscreenshot-$pkgver
	patch --strip=1 --input="${srcdir}/setup.py.patch"
}

build() {
	echo "Nothing to build"
}

check() {
	echo "Nothing to check"
}

package() {
	echo $pkgdir
	cd $srcdir/gscreenshot-$pkgver
	python setup.py install --root="$pkgdir/" --optimize=1 --force
	chmod +x "$pkgdir/usr/bin/gscreenshot"
}
