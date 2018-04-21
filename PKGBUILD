# Maintainer: Alex Dewar <a.dewar@sussex.ac.uk>
pkgname=gitignore-git
pkgver=r2763.4b37ac26
pkgrel=1
pkgdesc="GitHub's useful collection of .gitignore templates"
arch=("any")
url="https://github.com/github/gitignore"
license=('custom:CC0-1.0')
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/gitignore"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -d "$pkgdir"/opt/gitignore
    cp -r "$srcdir"/gitignore/* "$pkgdir"/opt/gitignore

    install -d "$pkgdir"/usr/share/doc/$pkgname
    ln -s /opt/gitignore/README.md "$pkgdir"/usr/share/doc/$pkgname

    install -d "$pkgdir"/usr/share/licenses/$pkgname
    ln -s /opt/gitignore/LICENSE "$pkgdir"/usr/share/licenses/$pkgname
}
