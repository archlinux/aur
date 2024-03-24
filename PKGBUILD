# Maintainer:
# Contributor: clanger <virtualdemise at gmail dot com>
# Contributor: Aaron Coach <aur at ezpz dot cz>

_pkgname="powershell-editor-services"
pkgname="$_pkgname"
pkgver=3.18.1
pkgrel=1
pkgdesc='A common platform for PowerShell development support in any editor or application'
url="https://github.com/PowerShell/PowerShellEditorServices"
arch=('x86_64')
licence=('MIT')

depends=('powershell')

install="$_pkgname.install"

_pkgsrc="PowerShellEditorServices-$pkgver"
_pkgext="zip"

noextract=("$_pkgsrc.$_pkgext")

source=(
  "$_pkgsrc.$_pkgext"::"$url/releases/download/v$pkgver/PowerShellEditorServices.$_pkgext"
  "LICENSE-$pkgver"::"$url/raw/v$pkgver/LICENSE"
)

sha256sums=(
  'a3105b77da3ab88364e124e3d96348dead5d1299013523b03fa8855f7c23100a'
  '99bc3308d3b5f2018c5d7af9239548c6853a01f08db0a1d9247d16be647c5658'
)

package() {
  mkdir -p "$pkgdir/opt/$_pkgname"
  bsdtar -x -C "$pkgdir/opt/$_pkgname" -f "$srcdir/$_pkgsrc.$_pkgext"

  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
