# Maintainer: éclairevoyant

pkgname=lychee-photo-management
pkgver=4.7.4
pkgrel=1
pkgdesc="Easy to use and great looking photo management system"
arch=('any')
url="https://lycheeorg.github.io/"
license=('MIT')
depends=('php>=8.1' 'php-gd' 'mariadb')
optdepends=('php-apache: to use the Apache web server')
options=('!strip' emptydirs)
source=("$pkgname-$pkgver.tar.gz::https://github.com/LycheeOrg/Lychee/archive/v$pkgver.tar.gz"
        'apache.example.conf')
b2sums=('7345c109296e394d9438c8d8c70521af2c1c97af49b4fe492bceef4a632e02137060a0e370430a13c43a77ac42259075b521115e96e2f061ec9bab6bd2b69833'
        'd989b2940b26787315d08ea40bf23184de09b66c4d400da4022cedf24daa09596eb8841afee3aa7f984d28dc15968b76f0048a1c436b0cf2a27f1cbfa0bde31e')

package() {
	install -d "$pkgdir"/usr/share/webapps/
	cp -a Lychee-$pkgver "$pkgdir"/usr/share/webapps/$pkgname

	find "$pkgdir"/usr/share/webapps/$pkgname -type f -exec chmod 0644 {} \;
	find "$pkgdir"/usr/share/webapps/$pkgname -type d -exec chmod 0755 {} \;

	install -Dm644 apache.example.conf -t "$pkgdir/etc/webapps/$pkgname/"
}
