# Maintainer: budRich
# Contributor: budRich

pkgname=i3ass
pkgver=2022.05.20.2
pkgrel=1
pkgdesc='A bash-script collection to assist the use of i3-wm.'
arch=('any')
# url='file:///home/bud/git/i3ass'
url='https://github.com/budlabs/i3ass'
license=('MIT')
groups=()
depends=('bash>=4.0.0' 'i3-wm' 'gawk' 'sed')
makedepends=('gawk' 'sed')
optdepends=('rofi' 'xdotool')
provides=()
conflicts=('i3-gaps')
replaces=()
backup=()
options=()
install=
changelog=
# source=("${pkgname}::git+$url")
source=("$url/archive/$pkgver/${pkgname}-$pkgver.tar.gz")
noextract=()
sha256sums=('ac772c40169c9ff7c29ba9f2fe3a5506b0b657ba96d44e6344392e6bab387359')

package() {
  # cd "$pkgname"
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" PREFIX=/usr
  make DESTDIR="$pkgdir/" PREFIX=/usr install

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
