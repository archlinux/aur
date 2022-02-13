# Maintainer: Alexander Jacobsen

pkgname=sony-remote
gitname=SonyRemote
pkgver=r5.981b9cb
pkgrel=1
pkgdesc="Sony BRAVIA TV Remote using the builtin REST API"
arch=('any')
url="https://github.com/AlexBMJ/SonyRemote"
license=('GPL3')
depends=('python-requests')
source=("git+https://github.com/AlexBMJ/$gitname")
md5sums=('SKIP')

pkgver() {
  cd "$gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$gitname"
	install -dm0755 ~/.local/share/$pkgname
	install -Dm0755 sony-remote.py ~/.local/bin/$pkgname
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
