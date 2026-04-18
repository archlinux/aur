# Maintainer: waschtl <tyrolyean@tyrolyean.net>

pkgname=icy_term-bin
pkgver=0.8.3
pkgrel=1
provides=("icy_term")
pkgdesc="IcyTERM is a BBS terminal program with allows you to connect to BBSes"
groups=("icy_tools-bin")
arch=('x86_64')
url="https://github.com/mkrueger/icy_tools"
license=('Apache-2.0')
makedepends=()
optdepends=()
source=("$url/releases/download/IcyTerm$pkgver/icy_term_linux_$pkgver.zip")
sha256sums=('9843676bb18850d0a05a0c492712d03922313b4b9813068f85f7f5118fb2ef2e')
sha512sums=('bb6c6df5052a21320a9e69291c4d0ad322a265eb2ecb363edfe34628a46d4b3a48a6ad11e8c4ddaf0e8e9d84478be5e78cf4533d952eb056380bbd1303ae4d78')

prepare() {
	cd "${srcdir}/"
	ar -x "icy_term.deb"
	bsdtar -xvf data.tar.xz
}

package() {
  cd "${srcdir}/"
  install -DTm0755 "$srcdir/usr/share/doc/icy-term/copyright" "$pkgdir/usr/share/doc/icy-term/copyright"
  install -DTm0755 "$srcdir/usr/share/applications/icy_term.desktop" "$pkgdir/usr/share/applications/icy_term.desktop"
  install -DTm0755 "$srcdir/usr/share/icons/hicolor/128x128/apps/icy_term.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/icy_term.png"
  install -DTm0755 "$srcdir/usr/share/icons/hicolor/256x256/apps/icy_term.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/icy_term.png"
  install -DTm0755 "$srcdir/usr/bin/icy_term" "$pkgdir/usr/bin/icy_term"
}
