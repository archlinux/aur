# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
# Contributor: Travis Nickles <ryoohki7@yahoo.com>

pkgname=doom3-inhell
pkgver=1.1dc
pkgrel=1
pkgdesc='Doom3 mod inspired by the classic "Ultimate Doom"'
arch=('any')
url="http://doom3.filefront.com/file/;83607"
license=('unknown')
depends=('bash' 'doom3')
makedepends=('tar' 'lzma')
source=(http://oxygen4.free.fr/dl/in_hell-$pkgver.tar.lzma \
	$pkgname.sh \
	$pkgname.png \
	$pkgname.desktop)
md5sums=('90d09a5128a11769b78b9e292fe997b8'
         '0082fef66d0c35bdf4e1cfa01d65513f'
         'a2025a0b6f52850fb8403ebe2d953c41'
         '1b0b14d74f185a2060de4b7e9cdc43d0')

build() {
  msg "Extracting in_hell-$pkgver.tar.lzma..."
  tar --lzma -xf in_hell-$pkgver.tar.lzma || return 1

  mkdir -p "$pkgdir"/opt/doom3
  cp -rf in_hell-$pkgver/ "$pkgdir"/opt/doom3/in_hell/

  install -Dm644 $pkgname.png "$pkgdir"/usr/share/pixmaps/$pkgname.png
  install -Dm644 $pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop

  install -Dm755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
}
