# Maintainer: Rohit Lodha <rohitlodha at gmail dot com>

pkgname=arch-dracut-hook
pkgver=1.0.0
pkgrel=1
pkgdesc="Install/remove hooks for dracut"
url=https://dracut.wiki.kernel.org/index.php/Main_Page
arch=('any')
license=('MIT')
depends=('dracut')
source=(
	"dracut-install"
	"dracut-remove"
	"90-dracut-install.hook"
	"60-dracut-remove.hook"
)

package() {
	install -Dm644 "${srcdir}/90-dracut-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-install.hook"
	install -Dm644 "${srcdir}/60-dracut-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-remove.hook"
	install -Dm755 "${srcdir}/dracut-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-install"
	install -Dm755 "${srcdir}/dracut-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-remove"
}
sha256sums=('9a7c112eb93907ea5c5cccfc83a490cbdb66301fd49ef2a8d8c7c22200911f78'
            'e79d74934e529d81912f6c0a35da780c49072eb34b30ef47405488501ce2c00a'
            'a3ac4c212829ce049cd5d1e676623a37a41de77cfe74fc1fadc7f05f2760f6e5'
            '46e20fb01171dcdba659acea0d041a73a22adff935b3849f638ccecc82fc92f3')
