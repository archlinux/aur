# Maintainer: Sving1024 <piano5432@outlook.com>
pkgname=albert-python-plugins-git
pkgver=r438.522196f
pkgrel=1
pkgdesc="albert offical python plugins"
arch=(x86_64)
url="https://github.com/albertlauncher/python"
license=('custom')
depends=('albert')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
	mkdir -p "${pkgdir}/usr/share/albert/python/plugins/"
	cp -rf "${srcdir}/python/." "${pkgdir}/usr/share/albert/python/plugins/"
	rm -rf "${pkgdir}/usr/share/albert/python/plugins/README.md"
	rm -rf "${pkgdir}/usr/share/albert/python/plugins/CONTRIBUTING.md"
}