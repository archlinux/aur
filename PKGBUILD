# Maintainer: Miguel Useche <migueluseche@mozilla-hispano.org>

pkgbase=otf-zilla-slab
pkgname=('otf-zilla-slab' 'ttf-zilla-slab')
pkgver=1.0
pkgrel=1
pkgdesc="Mozilla's Zilla Slab Type Family"
url=https://github.com/mozilla/zilla-slab
arch=('any')
depends=('fontconfig' 'xorg-font-utils')
source=($pkgname.tar.gz::https://github.com/mozilla/zilla-slab/releases/download/v$pkgver/Zilla-Slab-Fonts-v$pkgver.zip)
sha256sums=('678cccc1f3720e3a7d07610cb14f42074cae182025399406eaac72dfb449b733')
install=${pkgname}.install
license=("custom: SIL Open Font License")

package_otf-zilla-slab() {
    cd  "${srcdir}/otf/"
	find . -name '*.otf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/OTF/{} \;
	# install -D -m644 "${srcdir}/zilla-slab-master/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
}

package_ttf-zilla-slab() {
cd  "${srcdir}/ttf/"
	find . -name '*.ttf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
	# install -D -m644 "${srcdir}/zilla-slab-master/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname[1]}/LICENSE"
}


