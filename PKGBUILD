# Maintainer: Lucas Saliés Brum <lucas@archlinux.com.br>

pkgname=php7-ioncube_loader
pkgver=beta4
pkgrel=1
pkgdesc="Loader for PHP files encoded with ionCube PHP Encoder"
arch=(i686 x86_64)
url="http://www.ioncube.com/"
license=('CUSTOM')
depends=(php)
conflicts=('php-ioncube_loader')
backup=(etc/php/conf.d/00-ioncube_loader.ini)

source_i686=(php7-linux-x86-$pkgver.tgz::https://www.ioncube.com/php7-linux-x86-beta4.tgz)
source_x86_64=(php7-linux-x86-64-$pkgver.tgz::https://www.ioncube.com/php7-linux-x86-64-beta4.tgz)

sha256sums_i686=('83421468fc9300debd9092e3c9b0f20eee8143d5dd0cfd4fc956ae1a977a7e47')
sha256sums_x86_64=('d4806f817fd4b3455364feee4b35ea34eb53ebcc4f5f425500a1813f9e457f64')

package() {
	cd "$srcdir"/ioncube
	install -dm0755 "$pkgdir"/etc/php/conf.d
	install -Dm0755 ioncube_loader_lin_x86-64_7.0b4.so "$pkgdir"/usr/lib/php/modules/ioncube_loader.so
	echo "zend_extension = /usr/lib/php/modules/ioncube_loader.so" > "$pkgdir"/etc/php/conf.d/00-ioncube_loader.ini
	install -Dm0644 README_PHP7_X86_64_BETA "$pkgdir"/usr/share/doc/$pkgname/README.txt
}
