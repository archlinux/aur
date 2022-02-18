# Maintainer: rockmonstr
pkgname='katfetch'
pkgver=r90.85f71dd
pkgrel=1
pkgdesc="A simple, modular and hackable fetch script in Bash"
arch=('x86_64')
url="https://github.com/me0wing-katt0/katfetch"
license=('GPL')
depends=('xorg-xrandr' 'figlet' 'bash')
makedepends=('git')
source=('katfetch::git://github.com/me0wing-katt0/katfetch.git')
md5sums=('SKIP')


pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	install -dm755 ${pkgdir}/opt/
	mv ${pkgname} ${pkgdir}/opt/
	
	install -dm755 ${pkgdir}/usr/bin
	ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}
}
