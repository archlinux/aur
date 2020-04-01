# Maintainer: Greg Brown <greg.brown.00 at outlook dot com>
pkgname=dracut-sshd-git
pkgver=r56.cac3a8f
pkgrel=1
pkgdesc="Provide SSH access to initramfs."
arch=(any)
url="https://github.com/gsauthof/dracut-sshd"
license=(GPL3)
groups=()
depends=(dracut openssh)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/gsauthof/dracut-sshd.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dt "$pkgdir/usr/lib/dracut/modules.d/46sshd" 46sshd/*
}
