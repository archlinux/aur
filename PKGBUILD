# Maintainer: Semyon Maryasin <simeon@maryasin.name>
pkgname=aws-xray-daemon
pkgver=3.0.0
pkgrel=1
epoch=
pkgdesc="Listen for X-Ray segments on UDP port 2000 and pass them to AWS X-Ray API"
arch=('i686' 'x86_64')
url="http://docs.aws.amazon.com/xray/latest/devguide/xray-daemon.html"
license=('Apache')
groups=()
depends=(glibc)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=
source=("https://s3.dualstack.us-east-2.amazonaws.com/aws-xray-assets.us-east-2/xray-daemon/$pkgname-$pkgver.rpm")
noextract=()
md5sums=('d9763ee07f612763d1704a3134a06fc5')
validpgpkeys=()

package() {
	install -Dm 755 usr/bin/xray $pkgdir/usr/bin/xray
	# fix target directory: we want system-installed service files to live in /usr/lib, not /etc
	install -Dm 644 etc/systemd/system/xray.service $pkgdir/usr/lib/systemd/system/xray.service
	install -Dm 644 etc/amazon/xray/cfg.yaml $pkgdir/etc/amazon/xray/cfg.yaml
}
