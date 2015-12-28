# Maintainer: valvetime <valvetimepackages@gmail.com>

pkgname=heatmap-git
pkgver=20151228
pkgrel=1
pkgdesc="parse rtl_power output and generate a spectrum image"
arch=('any')
url="https://github.com/keenerd/rtl-sdr-misc/tree/master/heatmap"
license=('unknown')
#groups=('')
depends=('python' 'python-pillow' 'rtl-sdr')
makedepends=('wget' 'git')
#optdepends=()
source=(heatmap::"git+https://github.com/keenerd/rtl-sdr-misc.git")
md5sums=('SKIP')

build() {
        cd "$srcdir/heatmap/heatmap"
        chmod +x heatmap.py
	chmod +x flatten.py
	chmod +x raw_iq.py
}

package() {
        cd "$srcdir/heatmap/heatmap"
        install -Dm755 heatmap.py "${pkgdir}/usr/bin/heatmap"
        install -Dm755 flatten.py "${pkgdir}/usr/bin/flatten"
        install -Dm755 raw_iq.py "${pkgdir}/usr/bin/raw_iq"
	install -Dm755 Vera.ttf "${pkgdir}/usr/bin/Vera.ttf"

}
