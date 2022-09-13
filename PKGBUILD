pkgname=ttc-iosevka-slab-lite
pkgver=16.2.0
pkgrel=1
pkgdesc='Typeface family designed for coding, terminal use and technical documents.(Regular and bold only)'
arch=('any')
url='https://typeof.net/Iosevka/'
license=('OFL')
provides=('ttc-iosevka-slab')
conflicts=('ttc-iosevka-slab')
source=("https://github.com/be5invis/Iosevka/releases/download/v${pkgver}/ttc-iosevka-slab-${pkgver}.zip" "LICENSE.md-$pkgver::https://raw.githubusercontent.com/be5invis/Iosevka/v${pkgver}/LICENSE.md")
sha256sums=('a7126d4db6a5f119a623e60c831255234185b8d172cc97602820c4f4177cd4c2' '46ecadda73abf39cda76731a94fd357b743f882dc1156b4410a2967a811c4ff1')
noextract=("ttc-iosevka-slab-${pkgver}.zip")

prepare() {
	bsdtar xf "ttc-iosevka-slab-${pkgver}.zip" iosevka-slab-{regular,bold}.ttc
}

package() {
    install -d ${pkgdir}/usr/share/fonts/iosevka/
    install -m644 *.ttc ${pkgdir}/usr/share/fonts/iosevka/
    install -D -m644 LICENSE.md-$pkgver ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
}
