# Maintainer: Semyon Maryasin <simeon@maryasin.name>
pkgname=aws-xray-daemon
pkgver=2.0.0
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
install=
changelog=
source=("https://s3.dualstack.us-east-2.amazonaws.com/aws-xray-assets.us-east-2/xray-daemon/$pkgname-$pkgver.rpm")
noextract=()
md5sums=('ab96cb73e17dffb757d395a0f0ebd6df')
validpgpkeys=()

prepare() {
	# the rpm we downloaded contains init scripts for both upstart and systemd;
	# but we don't need initctl so let's remove it.
	rm -rf etc/init
}

package() {
	cp -a etc usr $pkgdir/
}
