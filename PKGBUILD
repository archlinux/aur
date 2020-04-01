# Maintainer: Daniel Milde <daniel@milde.cz>
pkgname=jaxx
pkgver=2.4.0
pkgrel=1
pkgdesc="Multi-chain cryptocurrency wallet"
arch=('x86_64')
url="https://jaxx.io/"
license=('proprietary')
options=(!strip)
source=("https://download-liberty.jaxx.io/Jaxx.Liberty-${pkgver}.AppImage" jaxx.png jaxx.desktop)
sha512sums=('31269150b0139f9ce6a8e65857aacb1338f1c9db22a74a519f1c1ea5f967f13d61004450d6df7fc3a75c46f067e2c7eeda4b62c8948e9b5ae17eb5b2c21dc531'
            '5314ae9a0b8054cb8709254ab2f95efd74bf0c4301e6014f9f4676c42c09617da777143b6027843641c54f71abfe4a7c3f9dcc78e32ff807b2e9e92e85a6a7f8'
            'b7852e094922a5d2ed6c8963bc9961c60124e71f6c253d3f8d846de9e5d32e91dfb6bf7709a3af4f2956f5bb791439a144910786e44f160604e9eddec53745c2')

package() {
        mkdir -p $pkgdir/opt/$pkgname
        install -Dm755 Jaxx.Liberty-${pkgver}.AppImage "$pkgdir/opt/$pkgname/Jaxx.Liberty-${pkgver}.AppImage"
	install -Dm644 jaxx.png "$pkgdir/opt/$pkgname/jaxx.png"
	install -Dm644 jaxx.desktop "$pkgdir/usr/share/applications/jaxx.desktop"

        mkdir -p "$pkgdir/usr/bin"
        ln -s /opt/$pkgname/Jaxx.Liberty-${pkgver}.AppImage "$pkgdir/usr/bin/$pkgname"
}
