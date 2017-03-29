##PKGBUILD
pkgname=hedera-theme-git
pkgver=0.r1.487359f
pkgrel=3
pkgdesc='Eye-friendly GUIKit based on breeze'
arch=('x86_64')
url='https://github.com/sixsixfive/Hedera/blob/master/readme.md'
depends=('breeze')
gitname=Hedera
makedepends=(git coreutils)
optdepends=('qt5ct-svg: needed for the darker sub theme'
		'breeze-kde4: for qt4'
		'gtk2: gtk2'
		'gtk-engines: gtk2'
		'gtk-engine-murrine: gtk2'
		'gtk3>=3.20: gtk3'
		'gtk3-noosb: gtk3'
		'gtk3-nocsd-git: optional for gtk3'
		'qupzilla'
		'konsole'
		'yakuake'
		'chromium'
		'qterminal')
#kde gtk config breaks gtk2 font settings!
conflicts=("kde-gtk-config")
license=(CCPL:cc-by-sa-4.0)
source=("$gitname::git://github.com/sixsixfive/Hedera")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$gitname"
	printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $srcdir/$gitname
	install -dm 755 "$pkgdir"/usr/share
	cp -drv --no-preserve='ownership' THEME/* $pkgdir/usr/share/
}
