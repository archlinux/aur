pkgname=theme.sh-git
_pkgname=theme.sh
provides=("theme.sh")
pkgver=20210107.45d3236
pkgrel=1
arch=('any')
source=("git+https://github.com/lemnos/theme.sh.git")
md5sums=("SKIP")

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

package() {
	chmod +x "$srcdir/$_pkgname/theme.sh"
  install -Dm755 "$srcdir/$_pkgname/theme.sh" "$pkgdir/usr/bin/theme.sh"
}
