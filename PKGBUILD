# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: mditto <michael.r.ditto@gmail.com>
pkgname=paintstorm
pkgver=2.21
pkgrel=1
pkgdesc="Professional software for digital painting"
arch=('x86_64')
url="http://www.paintstormstudio.com"
license=('Commercial')
depends=('gtk2' 'freeglut' 'ftgl')
source=("http://mdit.to/files/aur/$pkgname-$pkgver.tar.gz")
sha256sums=('f89540e814e1ff5351e33eca84e862ad5a61be78d76b3a2ae724622e9491ecc3')

package() {
    mkdir -p ${pkgdir}/usr/share/${pkgname}
    mkdir -p ${pkgdir}/usr/share/applications
    
	tar -xf "$pkgname-$pkgver.tar.gz" -C "${pkgdir}/usr/share/"

    rm ${pkgdir}/usr/share/install.sh
    mv ${pkgdir}/usr/share/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
