# Maintainer: HeroBrine1st Erquilenne <aur@herobrine1st.ru>
pkgname=dreamfinity
pkgver=1.0.0
pkgrel=1
pkgdesc="FML-compatible Minecraft servers project's launcher"
arch=('x86_64')
url="https://dreamfinity.org"
license=('unknown')
depends=('jre8')
optdepends=('firejail: to sandbox launcher and the game')
source=("$pkgname-$pkgver.jar::$url/Dreamfinity.jar"
        "dreamfinity.profile"
        "dreamfinity"
        "dreamfinity.desktop"
        "dreamfinity.svg::https://raw.githubusercontent.com/Noire86/Dreamfinity-Brand-Logo/1cc4b6b487d37cb8c76abfe0187253059fc01a01/gearlogo/SVG/logo.svg")
noextract=("$pkgname-$pkgver.jar")
sha256sums=("3d5bcf2ba6cccfc6bdfd0e523300362ef0eac8c81a8096c11784024c1712a15c"
            "SKIP"
            "SKIP"
            "SKIP"
            "d175b9f7c39d0b69d16bd1441cb2ab57af829f93f10a916817b604d759520e59")

package() {
    install -Dm 755 "$srcdir/$pkgname-$pkgver.jar" "$pkgdir/opt/Dreamfinity/Dreamfinity.jar"
    install -Dm 644 "$srcdir/dreamfinity.profile" "$pkgdir/etc/firejail/dreamfinity.profile"
    install -Dm 755 "$srcdir/dreamfinity" "$pkgdir/usr/bin/dreamfinity"
    install -Dm 644 "$srcdir/dreamfinity.desktop" "$pkgdir/usr/share/applications/dreamfinity.desktop"
    install -Dm 644 "$srcdir/dreamfinity.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/dreamfinity.svg"
}
