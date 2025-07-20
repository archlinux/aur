# Maintainer: Miguel Useche <migueluseche@mozilla-hispano.org>

pkgbase=ttf-zilla-slab
pkgname=('ttf-zilla-slab')
pkgver=1.002
pkgrel=1
pkgdesc="Mozilla's Zilla Slab Type Family"
url=https://github.com/mozilla/zilla-slab
arch=('any')
depends=('fontconfig' 'xorg-mkfontscale')
source=($pkgname.tar.gz::https://github.com/mozilla/zilla-slab/releases/download/v$pkgver/Zilla-Slab-Fonts-v$pkgver.zip)
sha256sums=('62490dc19cd17e2951fe88ba3e662089ca14077634cacf1f12926374281dcf42')
install=${pkgname}.install
license=("custom: SIL Open Font License")

package() {
    cd  "${srcdir}/zilla-slab/ttf/"
	find . -name '*.ttf' -execdir install -Dm644 {} $pkgdir/usr/share/fonts/TTF/{} \;
	# install -D -m644 "${srcdir}/zilla-slab/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname[0]}/LICENSE"
}
