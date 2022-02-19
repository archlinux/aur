# Maintainer: Leonidas P. <jpegxguy at outlook dot com>
# Contributor: Franklyn Tackitt <franklyn@tackitt.net>
# Contributor: Kevin Del Castillo <quebin31@gmail.com>

pkgname=dracut-hook
pkgver=0.5.2
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
sha256sums=('774b865860823046700fbbdbc424710993c89ba11d224f2a22cf722cea4b0802'
            'b4f42374e4c8f05c0adc7acf3679b14b91f4eab6ac3b81e9de49314a65947ed8'
            'de09e8e65837b189aec0a8c9a067143880faff14467a5573949f772f39c053b3'
            'e79f8e9572c5d1af6052104eac7ff956754f7a191b52b16adf12b65a38e9b4ed')

package() {
	install -Dm644 "${srcdir}/90-dracut-install.hook" "${pkgdir}/usr/share/libalpm/hooks/90-dracut-install.hook"
	install -Dm644 "${srcdir}/60-dracut-remove.hook"  "${pkgdir}/usr/share/libalpm/hooks/60-dracut-remove.hook"
	install -Dm755 "${srcdir}/dracut-install"         "${pkgdir}/usr/share/libalpm/scripts/dracut-install"
	install -Dm755 "${srcdir}/dracut-remove"          "${pkgdir}/usr/share/libalpm/scripts/dracut-remove"
}
