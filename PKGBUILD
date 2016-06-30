# Maintainer: Jorispilot <jorispilot@aquilenet.fr>
pkgname=gnuplot-colorbrewer-git
pkgver=1.0.9.ge8e4742
pkgrel=1
pkgdesc="ColorBrewer color schemes in gnuplot"
arch=('any')
url="https://github.com/aschn/gnuplot-colorbrewer"
license=('Apache')
source=("git+https://github.com/aschn/gnuplot-colorbrewer.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir"/"${pkgname%-git}"
    git describe --tags | sed 's|-|.|g'
}

package() {
    cd "$srcdir"/"${pkgname%-git}"
    install -d "$pkgdir/usr/share/${pkgname%-git}/"
    cp -r "diverging"  "qualitative" "sequential" "$pkgdir/usr/share/${pkgname%-git}/"
}
