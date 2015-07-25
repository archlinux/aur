# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: Manuel Hüsers <manuel.huesers@uni-ol.de>
# Contributor: Wenzhi Liang <wenzhi.liang@gmail.com>

pkgname=ttf-envy-code-r
pkgver=preview7
_pkgver=PR7
pkgrel=6
pkgdesc="Free scalable coding font by DamienG"
arch=('any')
url="http://damieng.com/blog/tag/envy-code-r"
license=('freeware')
depends=('fontconfig' 'xorg-fonts-encodings' 'xorg-font-utils')
install=envycoder.install
source=("http://download.damieng.com/fonts/original/EnvyCodeR-$_pkgver.zip")
sha256sums=('9f7e9703aaf21110b4e1a54d954d57d4092727546348598a5a8e8101e4597aff')

package() {
	cd $srcdir/Envy\ Code\ R\ $_pkgver
    for f in *.ttf; do
        install -Dm644 "$f" "$pkgdir/usr/share/fonts/TTF/${f// }"
    done
	install -Dm644 Read\ Me.txt "$pkgdir/usr/share/licenses/$pkgname/readme.txt"
}
