# Maintainer: Nomz <nomzisnice@yahoo.com>
# Contributor: Twann <twann@ctemplar.com>

pkgname=tlauncher-org
pkgver=2.86
pkgrel=1
pkgdesc="Latest TL from tlauncher.org"
url="https://tlauncher.org"
arch=("any")
license=("custom")
depends=("java11-openjfx" "jdk11-openjdk" "jre11-openjdk" "jre11-openjdk-headless")
conflicts=("tlauncher-bin")
replaces=("tlauncher-bin")
source=(
"${pkgname}-${pkgver}.zip::https://dl2.tlauncher.org/f.php?f=files%2FTLauncher-${pkgver}.zip"
"tlauncher.desktop"
"https://launcher.mojang.com/download/minecraft-launcher.svg"
)
sha512sums=('eae5fe49cd95bc3dc55572a660a26f7626b339ae50fe7304b61fcc335bf1ed30804481cc9a8e75a2be5d6bc9c6ef5d1050b7eafab905d8e54f3ecaaa046a0e10'
            'b6f45e7ffa7e2c0313a743af07c22be2992c9933153749d08c9c5cabccf921586744023e788acef3499daf31ac6bd441c2a68982f0790fa5f749cc429cbe6033'
            'aa08e8fa2a5c1c3e2d714644cb9648adb779c09fff5a9e5b79cea42c53be3f53631d199f72c1eec56e4b4f8e46be8f4ae88fbe456865621b589a7c4f9438549a')

package() {
	cd "$srcdir"
	install -Dm644 "$srcdir/TLauncher-$pkgver.jar" "$pkgdir/opt/tlauncher/tlauncher.jar"
	install -Dm644 "$srcdir/tlauncher.desktop" "$pkgdir/usr/share/applications/tlauncher.desktop"
	install -Dm644 "$srcdir/minecraft-launcher.svg"    "$pkgdir/usr/share/icons/hicolor/symbolic/apps/tlauncher.svg"
}
