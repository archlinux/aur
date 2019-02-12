# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=('git-nautilus-icons-git' 'git-nemo-icons-git' 'git-caja-icons-git')
pkgbase=git-nautilus-icons-git
_gitname=git_nautilus_icons
pkgver=r39.2cef1d6
pkgrel=1
arch=('x86_64' 'i686')
url="https://github.com/chrisjbillington/$_gitname"
license=('BSD 2-Clause "Simplified"')
source=("git+https://github.com/chrisjbillington/$_gitname.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$_gitname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package_git-nautilus-icons-git() {
	pkgdesc="A Nautilus Python extension to overlay icons on files in git repositories"
	depends=('python-gobject' 'python-nautilus')
	provides=(git-nautilus-icons)
	
	cd "$srcdir/$_gitname"
	install -d $pkgdir/usr/share/{icons,nautilus-python/extensions}
	cp -r icons/hicolor $pkgdir/usr/share/icons
	install -Dm644 git-nautilus-icons.py $pkgdir/usr/share/nautilus-python/extensions/git-nautilus-icons.py
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/git-nautilus-icons/LICENSE"
}

package_git-nemo-icons-git() {
	pkgdesc="A Nemo Python extension to overlay icons on files in git repositories"
	depends=('python-gobject' 'nemo-python')
	provides=(git-nemo-icons)
	
	cd "$srcdir/$_gitname"
	install -d $pkgdir/usr/share/{icons,nemo-python/extensions}
	cp -r icons/hicolor $pkgdir/usr/share/icons
	install -Dm644 git-nautilus-icons.py $pkgdir/usr/share/nemo-python/extensions/git-nemo-icons.py
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/git-nemo-icons/LICENSE"
}

package_git-caja-icons-git() {
	pkgdesc="A Caja Python extension to overlay icons on files in git repositories"
	depends=('python2-gobject' 'python2-caja')
	provides=(git-caja-icons)
	
	cd "$srcdir/$_gitname"
	install -d $pkgdir/usr/share/{icons,caja-python/extensions}
	cp -r icons/hicolor $pkgdir/usr/share/icons
	install -Dm644 git-nautilus-icons.py $pkgdir/usr/share/caja-python/extensions/git-caja-icons.py
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/git-caja-icons/LICENSE"
}

