# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Contributor: Franklyn Tackitt <franklyn@tackitt.net>
# Contributor: Kevin Del Castillo <quebin31@gmail.com>

pkgname=dracut-hook
pkgver=0.5.3
pkgrel=1
pkgdesc="Install/remove hooks for dracut"
url=https://dracut.wiki.kernel.org/index.php/Main_Page
arch=('any')
license=('BSD')
depends=('dracut')
source=(
	"dracut-install"
	"dracut-remove"
	"90-dracut-install.hook"
	"60-dracut-remove.hook"
)
sha256sums=('4539f8b4e4caef233b39a308891cf448de546efaad61579e9332e312e8c4ea3a'
            '8d7fe6622dcbe5fb8a4b0df33265e82bd895e328d202a841a46859c1dd99d47e'
            'de09e8e65837b189aec0a8c9a067143880faff14467a5573949f772f39c053b3'
            'e79f8e9572c5d1af6052104eac7ff956754f7a191b52b16adf12b65a38e9b4ed')

package() {
	install -Dm644 "${srcdir}/90-dracut-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-install.hook"
	install -Dm644 "${srcdir}/60-dracut-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-remove.hook"
	install -Dm755 "${srcdir}/dracut-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-install"
	install -Dm755 "${srcdir}/dracut-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-remove"
}
