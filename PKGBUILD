# Maintainer: Miguel Useche <migueluseche@mozilla-hispano.org>

pkgbase=otf-zilla-slab
pkgname=('otf-zilla-slab' 'ttf-zilla-slab')
pkgver=1
pkgrel=1
pkgdesc="Mozilla's Zilla Slab Type Family"
url=https://github.com/mozilla/zilla-slab
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
source=($pkgname.tar.gz::https://github.com/mozilla/zilla-slab/archive/master.zip)
sha256sums=('113c450d524a29cf5bfae01d4cdad4d2c04424c54d2e14d4bfb6564f2ec71142')
install=${pkgname}.install
license=("custom: SIL Open Font License")

package_otf-zilla-slab() {
    cd  "${srcdir}/zilla-slab-master/OTF_release files/"
	find . -name '*.otf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
	install -D -m644 "${srcdir}/zilla-slab-master/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
}

package_ttf-zilla-slab() {
cd  "${srcdir}/zilla-slab-master/TTF_release files/"
	find . -name '*.ttf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
	install -D -m644 "${srcdir}/zilla-slab-master/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname[1]}/LICENSE"
}


