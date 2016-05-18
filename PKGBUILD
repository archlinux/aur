# Maintainer: James Reed <supplantr at archlinux dot info>

_pkgname=busking
pkgname=$_pkgname-git
pkgver=20150528.14
pkgrel=1
pkgdesc='A simple, regex-based xdg-open replacement.'
arch=('any')
url='https://github.com/supplantr/busking'
license=('GPL3')
depends=('perl-file-mimeinfo' 'procps')
makedepends=('git')
provides=("$_pkgname" 'xdg-utils')
conflicts=("$_pkgname" 'xdg-utils')
backup=('etc/xdg/busking/config')
source=("$_pkgname::git://github.com/supplantr/busking.git")
md5sums=('SKIP')

pkgver() {
	    cd "$srcdir/$_pkgname"
	        echo "$(git log -1 --format="%cd" --date=short | sed 's|-||g').$(git rev-list --count master)"
	}

	package() {
		    cd "$srcdir/$_pkgname"
		        install -Dm755 xdg-open "$pkgdir/usr/bin/xdg-open"
			    install -Dm644 config "$pkgdir/etc/xdg/busking/config"
		    }

