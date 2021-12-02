# Maintainer: Yuuta Liang <yuuta@yuuta.moe>
pkgname='enchantmentcracker-bin'
pkgver='1.6'
pkgrel=1
epoch=
pkgdesc='Cracking the XP seed in Minecraft and choosing your enchantments'
arch=('any')
url='https://github.com/Earthcomputer/EnchantmentCracker'
license=('MIT')
depends=('java-runtime=8' bash)
makedepends=('unzip')
source=("https://github.com/Earthcomputer/EnchantmentCracker/releases/download/v$pkgver/enchcracker-${pkgver//_/-}.zip"
	"https://raw.githubusercontent.com/Earthcomputer/EnchantmentCracker/v$pkgver/LICENSE.txt"
	"enchcracker")
noextract=("enchcracker-${pkgver//_/-}.zip")

md5sums=('12e4ec378c04a97136b1487065dbb6bb'
         '47d894a54821060b37984df5ee85c467'
         'f0322a90cebb3bdb20e65c1fdca5b33c')

prepare() {
	cd $srcdir
	unzip -o "enchcracker-${pkgver//_/-}.zip"
}

package() {
        cd "enchcracker-${pkgver//_/-}"
	mkdir -p "$pkgdir/usr/share/java/"
	mkdir -p "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/licenses/enchantmentcracker/"
	install -Dm755 "$srcdir/enchcracker" "$pkgdir/usr/bin/enchcracker"
	install -Dm644 "./lib/enchcracker-${pkgver//_/-}.jar" "$pkgdir/usr/share/java/enchcracker.jar"
	install -Dm644 "$srcdir/LICENSE.txt" "$pkgdir/usr/share/licenses/enchantmentcracker/LICENSE"
}
