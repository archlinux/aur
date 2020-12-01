# Maintainer:  <yatsen71@oarchbox1>
pkgname=bt-tracker-add
pkgver=2020.12
pkgrel=1
epoch=
pkgdesc="Automatically checks new torrents and adds trackers"
arch=('i686' 'x86_64')
url="https://aur.archlinux.org/packages/bt-tracker-add/"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(manual-tracker-add.sh
        tracker-add-auto-router.sh
        tracker-add-auto.sh
        transmission-tracker-add.service)
md5sums=('8c37a6925e044e73cc761a71d362555f'
         'fa818c0c2dee082f4988c69687e26227'
         '1d3de754a24ee40f007c9c0aa03ebd50'
         '13d7c4c3b186edf36b81bf9fa309e671')
noextract=()

prepare() {
  mkdir -p "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-$pkgver"

  #patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  #./configure --prefix=/usr
  #make
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  #make -k check
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  #make DESTDIR="$pkgdir/" install
  install -vDm 0755 ../manual-tracker-add.sh "$pkgdir/usr/bin/manual-tracker-add.sh"
  install -vDm 0755 ../tracker-add-auto.sh "$pkgdir/usr/bin/tracker-add-auto.sh"
  install -vDm 0755 ../tracker-add-auto-router.sh "$pkgdir/usr/bin/tracker-add-auto-router.sh"
  install -vDm 0644 ../transmission-tracker-add.service "$pkgdir/usr/lib/systemd/user/transmission-tracker-add.service"
}

# vim:set ts=2 sw=2 et:
