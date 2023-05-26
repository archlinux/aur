# Maintainer: Arne Brücher <archlinux [at] arne-bruecher [dot] de>

pkgname=project-black-pearl-bin
pkgver=0.3.0
pkgrel=1
pkgdesc='Free and open-source tool for managing game sources using community-made modules.'
arch=('x86_64')
url='https://github.com/ProjectBlackPearl/project_black_pearl'
license=('BSD')
depends=('libayatana-appindicator' 'webkit2gtk-4.1' 'gtk3')
makedepends=('binutils' 'tar')
provides=('project-black-pearl')
conflicts=('project-black-pearl')
source=("$url/releases/download/pbp-stable-v$pkgver/"$pkgname"_"$pkgver"_amd64.deb")
sha256sums=('412123582fb25cc42c4331619a63379a6abc00d5e1344f2f84ae820938462acd')

prepare () {
	ar x "$pkgname"_"$pkgver"_amd64.deb
	tar xvf data.tar.gz
}

package () {
   install -Dv "$srcdir/usr/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"
   install -Dv "$srcdir/usr/share/applications/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
   install -Dv "$srcdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/32x32/apps/$pkgname.png"
   install -Dv "$srcdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/$pkgname.png"
   install -Dv "$srcdir/usr/share/icons/hicolor/256x256@2/apps/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$pkgname.png"

}
