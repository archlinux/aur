# Maintainer: Sam L. Yes <manjaroyes123@outlook.com>
# Upstream Maintainer: Stefano Capitani <stefanoatmanjarodororg>
# Upstream Contributors: star2000 <i@star2000.work>

pkgbase=manjaro-asian-input-support
pkgname=('ibus-input-support' 'fcitx-input-support')
pkgver=2020.06
pkgrel=1
pkgdesc="Manjaro Asian input support"
arch=('any')
url="https://gitlab.manjaro.org/packages/community/manjaro-asian-input-support"
license=('GPL')
source=('enable-ibus.sh' 'enable-fcitx.sh' 'ibus.desktop')
md5sums=('b974be25b7f91c392009cb8d9f1bd5b4'
         'fdbfae1bba8012daf984a76d7004ae3e'
         'f1a9f3406f8268383149889f4816cd52')
conflicts=("${pkgbase}-gtk" "${pkgbase}-qt" "${pkgbase}-ibus" "${pkgbase}-fcitx")

package_ibus-input-support() {
	pkgdesc='Manjaro Asian input support for ibus, with dependencies set to optional.'
	#depends=('ibus')
	optdepends=(
		'ibus-libpinyin: a Chinese IME'
		'ibus-anthy: a Japanese IME'
		'ibus-hangul: a Korean IME'
		'ibus-unikey: a Vietnamese IME'
		'ibus-m17n: other languages provided by M17n (http://www.nongnu.org/m17n/)'
	)
	provides=("${pkgbase}-ibus")

	install -Dm644 "$srcdir/enable-ibus.sh" "$pkgdir/etc/profile.d/input-support.sh"
	install -Dm644 "$srcdir/ibus.desktop" "$pkgdir/etc/xdg/autostart/ibus.desktop"
}

package_fcitx-input-support() {
	pkgdesc='Manjaro Asian input support for fcitx, with dependencies set to optional.'
	optdepends=(
		'fcitx-qt5: QT input module'
		'fcitx-gtk3: GTK input module'
		'fcitx-configtool: GUI configuration tool'
		'fcitx-qt4: required by some closed source Chinese IMEs'
		'fcitx-googlepinyin: a Chinese IME'
		'fcitx-cloudpinyin: Internet resources to provide candidate input for Chinese'
		'fcitx-mozc: a Japanese IME'
		'fcitx-hangul: a Korean IME'
		'fcitx-unikey: a Vietnamese IME'
		'fcitx-sayura: a Sinhalese IME'
		'fcitx-m17n: other languages provided by M17n (http://www.nongnu.org/m17n/)'
		'kcm-fcitx: KDE configuration module')
	provides=("${pkgbase}-fcitx")

	install -Dm644 "$srcdir/enable-fcitx.sh" "$pkgdir/etc/profile.d/input-support.sh"
}
