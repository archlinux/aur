# Maintainer: Guoyi Zhang <myname at malacology dot net>
pkgname=seqdistk
_pkgname=SeqDistK
pkgver=1.0
pkgrel=1
pkgdesc="tools to calculate the distance among sequence"
arch=('x86_64')
url="https://github.com/htczero/SeqDistK"
license=('GPL')
depends=('mono')
makedepends=('mono-msbuild')
source=("$url/archive/refs/tags/$pkgver.tar.gz"
		"$_pkgname"
		"$_pkgname.desktop"
		"$_pkgname.png")
sha256sums=('d44b28cd869664db5f873d85edb99d9ab0dcc759493b7979493da78fa5cb1e62'
            '52f67ec51c9f9a2ebb04a489562fb3ed71ad368e9cea05212a4a79a50de5fbd3'
            '4861f4da96744412cc528e3cfaa19ab11811a2591de5760042f89c60c4c21ec7'
            '6d4997ed458027f1e4d25ee69514055cf3a6861f7a391fedb2885ab08bcdcd7a')
build() {
  cd "$_pkgname-$pkgver"
  msbuild
}

package() {
  install -Dm 755 $_pkgname $pkgdir/usr/bin/$_pkgname
  install -Dm 755 $_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
  install -Dm 644 $_pkgname.png $pkgdir/usr/share/icons/hicolor/scalable/apps/$_pkgname.png
  install -Dm 644 $_pkgname.png $pkgdir/usr/share/icons/hicolor/symbolic/apps/$_pkgname.png
  cd "$_pkgname-$pkgver"
  install -Dm 755 $_pkgname/bin/Debug/$_pkgname.exe $pkgdir/usr/share/$_pkgname/$_pkgname.exe

}
