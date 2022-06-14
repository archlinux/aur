# Maintainer: Aaron Coach <aur at ezpz dot cz>

pkgname=powershell-editor-services
pkgver=3.4.3
pkgrel=1

pkgdesc='A common platform for PowerShell development support in any editor or application!'
url='https://github.com/PowerShell/PowerShellEditorServices'
arch=('x86_64')
licence=('MIT')
depends=('powershell')

install="$pkgname".install

source=("PowerShellEditorServices-$pkgver.zip::https://github.com/PowerShell/PowerShellEditorServices/releases/download/v$pkgver/PowerShellEditorServices.zip"
	"LICENSE-$pkgver::https://raw.githubusercontent.com/PowerShell/PowerShellEditorServices/v$pkgver/LICENSE")

noextract=("PowerShellEditorServices-$pkgver.zip")

sha256sums=('a3686a5809927e65446af7f1e6f2a99c4358139cada7cb12b45b0d415a0b8005'
            '99bc3308d3b5f2018c5d7af9239548c6853a01f08db0a1d9247d16be647c5658')

package() {
	mkdir -p "$pkgdir"/opt/powershell-editor-services
	bsdtar -x -C "$pkgdir"/opt/powershell-editor-services \
	  -f "$srcdir"/PowerShellEditorServices-$pkgver.zip

	install -Dm0644 LICENSE-"$pkgver" \
	  "$pkgdir"/usr/share/licences/powershell-editor-services/LICENSE
}
