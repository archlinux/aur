# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>

pkgname=ttf-parastoo
pkgver=1.0.0_alpha2
pkgrel=1
pkgdesc="A beautiful Persian font based on ttf-gandom."
arch=('any')
url="https://rastikerdar.github.io/parastoo-font/"
license=('OFL')
groups=(persian-fonts)
depends=('fontconfig' 'xorg-font-utils')
source=("https://github.com/rastikerdar/parastoo-font/releases/download/v${pkgver//_/-}/parastoo-font-v${pkgver//_/-}.zip")
install=$pkgname.install
md5sums=('e677e30be5deab22ec13b12c344073e8')

package() {  
    install -d $pkgdir/usr/share/fonts/$pkgname
    cp -a ./web/Parastoo*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    cp -a ./web/{Farsi*,Without-Latin}/Parastoo*.{eot,ttf,woff} $pkgdir/usr/share/fonts/$pkgname/
    cp -a ./print/Parastoo*.ttf $pkgdir/usr/share/fonts/$pkgname/
    cp -a ./print/{Farsi*,Without-Latin}/Parastoo*.ttf $pkgdir/usr/share/fonts/$pkgname/
    install -Dm644 ./LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE  
}
