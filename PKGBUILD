# Maintainer: Jah Way <jahway603 at protonmail dot com>

_pkgname=aster-mail
pkgname="${_pkgname}"-bin
pkgver=1.4.51
pkgrel=1
pkgdesc="Encrypted email client for Aster Mail"
arch=('x86_64')
url="https://github.com/Aster-Privacy/Aster-Mail"
license=('AGPL-3.0-only')
provides=("$_pkgname")
conflicts=(
  "${_pkgname}-appimage"
  "${_pkgname}-git"
)
source=("$_pkgname-$pkgver-amd64.deb::$url/releases/download/v$pkgver/Aster-Mail-amd64.deb"
		"https://raw.githubusercontent.com/Aster-Privacy/Aster-Mail/refs/heads/main/LICENSE")
sha512sums=('59319a493190272c4c9366973b4b200f3aea3860b4634b0cd4e8bed19207e9fc050372f4c3150b8155f2f8ee6a92ce23827ed626fa7feabe05d3d09088e1664c'
            '3568a76677f3d55dbbc7fc33c4073b4714cc6f68d92cd842a9ca2b230e8bd2140e59c3fc3cce34be34ffed78d75ab6e9d991ba59bf7c4addde7fb96648d3375d')

package() {
  # extract from deb file
  tar -xf "$srcdir/data.tar.gz"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"

  install -Dm755 "$srcdir/usr/bin/$_pkgname-desktop" "$pkgdir/usr/bin/$_pkgname-desktop"
  install -Dm644 "$srcdir/usr/share/applications/Aster Mail.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"

  install -Dm644 "$srcdir/usr/share/icons/hicolor/128x128/apps/$_pkgname-desktop.png" 	"$pkgdir/usr/share/icons/hicolor/128x128/apps/$_pkgname-desktop.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/256x256@2/apps/$_pkgname-desktop.png" "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/$_pkgname-desktop.png"
  install -Dm644 "$srcdir/usr/share/icons/hicolor/32x32/apps/$_pkgname-desktop.png" 	"$pkgdir/usr/share/icons/hicolor/32x32/apps/$_pkgname-desktop.png"
}
