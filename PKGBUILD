# Maintainer: ifurther <>
# Contributor: Aaronjamt 
pkgname=ufw-docker
pkgver=251123
pkgrel=1
pkgdesc='To fix the Docker and UFW security flaw without disabling iptables.'
arch=('any')
url="https://github.com/chaifeng/${pkgname}"
license=('GPL License Version 3.0')
depends=('ufw' 'docker')
install=ufw-docker.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/chaifeng/$pkgname/archive/refs/tags/$pkgver.tar.gz"
	'ufw-docker.install')
b2sums=('d4ac771a83a5f7bd328c8d30094a45752dd1b38de7f2d7f5269e369289d9e8ef189b020b97e4d93025d9d7ad61757cda31f80e548e8611b77653f75e731400b7'
	'6f7c41d047dc2fd657708cbb9b35f52e06fbe03fed060e00696fb14ffd291ea4dae759b5d73780799ab0c773a015f16f4d5633b311de9130b3bd78da7d1aa9e3')

package() {
	pushd "$srcdir/$pkgname-$pkgver"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/ufw-docker/LICENSE"
	install -Dm755 ufw-docker "$pkgdir/usr/bin/ufw-docker"
}
