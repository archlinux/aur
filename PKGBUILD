# Maintainer: Thomas Oster <mail@thomas-oster.de>
pkgname=zrep-expire-git
pkgver=r23.1328444
pkgrel=1
pkgdesc="Zrep snapshot expiration tool (v2)"
arch=(any)
url="https://github.com/isaaceindhoven/zrep-expire"
license=('APACHE2.0')
groups=()
depends=('python' 'python-parsedatetime')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/isaaceindhoven/zrep-expire.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}


package() {
    cd "$srcdir/${pkgname%-git}"
    mkdir -p ${pkgdir}/usr/bin ${pkgdir}/etc
    cp zrep-expire ${pkgdir}/usr/bin/
    cp zrep-expire.conf ${pkgdir}/etc/
    chmod ugo+x ${pkgdir}/usr/bin/zrep-expire
}
