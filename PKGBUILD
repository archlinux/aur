# Maintainer: Jah Way <jahway603 at protonmail dot com>

_pkgname=aster-mail
pkgname="${_pkgname}"-bin
pkgver=1.4.55
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
sha512sums=('0a53131bd871f57a89446e7a029e1f60b2ca41c0ffbce71ec0e8d43c2c96b921df2b06b54326866860dc23a27738d27a8c70dc800efcdbce246e1e4d8ada873e'
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
