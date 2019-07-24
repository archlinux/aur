# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=('git-nautilus-icons-git' 'git-nautilus-icons-py2-git' 'git-nemo-icons-git' 'git-caja-icons-git')
pkgbase=git-nautilus-icons-git
pkgver=1.0.0.r26.95b65d3
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/git_nautilus_icons"
license=('BSD 2-Clause "Simplified"')
source=("git+https://github.com/chrisjbillington/git_nautilus_icons.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/git_nautilus_icons"
	printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package_git-nautilus-icons-git() {
	pkgdesc="A Nautilus Python 3 extension to overlay icons on files in git repositories"
	depends=('python-gobject' 'python-nautilus')
	provides=("${pkgbase%-git}")
	conflicts=("${pkgbase%-git}")

	cd "$srcdir/git_nautilus_icons"
	install -d $pkgdir/usr/share/{icons,nautilus-python/extensions}
	cp -r icons/hicolor $pkgdir/usr/share/icons
	install -Dm644 "${pkgbase%-git}.py" \
		"$pkgdir/usr/share/nautilus-python/extensions/${pkgbase%-git}.py"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgbase%-git}/LICENSE"
}

package_git-nautilus-icons-py2-git() {
	pkgdesc="A Nautilus Python 2 extension to overlay icons on files in git repositories"
	depends=('python2-gobject' 'python2-nautilus')
	provides=("${pkgname%-git}" "${pkgbase%-git}")
	conflicts=("${pkgname%-git}" "${pkgbase%-git}")

	cd "$srcdir/git_nautilus_icons"
	install -d $pkgdir/usr/share/{icons,nautilus-python/extensions}
	cp -r icons/hicolor $pkgdir/usr/share/icons
	install -Dm644 "${pkgbase%-git}.py" \
		"$pkgdir/usr/share/nautilus-python/extensions/${pkgbase%-git}.py"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgbase%-git}/LICENSE"
}

package_git-nemo-icons-git() {
	pkgdesc="A Nemo Python extension to overlay icons on files in git repositories"
	depends=('python-gobject' 'nemo-python')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/git_nautilus_icons"
	install -d $pkgdir/usr/share/{icons,nemo-python/extensions}
	cp -r icons/hicolor $pkgdir/usr/share/icons
	install -Dm644 "${pkgbase%-git}.py" \
		"$pkgdir/usr/share/nemo-python/extensions/${pkgname%-git}.py"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}

package_git-caja-icons-git() {
	pkgdesc="A Caja Python extension to overlay icons on files in git repositories"
	depends=('python2-gobject' 'python2-caja')
	provides=("${pkgname%-git}")
	conflicts=("${pkgname%-git}")

	cd "$srcdir/git_nautilus_icons"
	install -d $pkgdir/usr/share/{icons,caja-python/extensions}
	cp -r icons/hicolor $pkgdir/usr/share/icons
	install -Dm644 "${pkgbase%-git}.py" \
		"$pkgdir/usr/share/caja-python/extensions/${pkgname%-git}.py"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
}
