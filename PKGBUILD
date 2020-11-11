# Maintainer: Ohio2 (Maksymilian Sęk) <ohio2.mail@zohomail.eu>
# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
pkgname="ohio2-nerdfetch"
pkgver=4.01
pkgrel=1
pkgdesc="A POSIX fetch using NerdFonts"
arch=('any')
optdepends=('bc: memory percent')
url="https://github.com/Ohio2/NerdFetch"
license=('GPL')
makedepends=('git')
source=("git+https://github.com/Ohio2/NerdFetch")
noextract=()
md5sums=('SKIP')

ask(){
  echo 'What distro do you use? (1. Arch, 2.Manjaro)'
  read dist
  if [ dist=1 ]
  then
    set dist-file=nerdfetch
  elif [ dist=2 ]
  then 
    set dist-file=nerdfetch-manj
  else
    echo 'Invalid input... Halting!'
    stop
}
pkgver() {
	cd NerdFetch
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd NerdFetch
}

package() {
	install -Dm755 "$srcdir"/NerdFetch/nerdfetch "$pkgdir/usr/bin/nerdfetch-ohio2"
	install -Dm644 "$srcdir"/NerdFetch/README.md "$pkgdir/usr/share/doc/$pkgname"
}
