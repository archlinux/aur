# Maintainer: Daniel T. Borelli < daltomi at aol >

pkgbase=moc_notify-git
pkgname=$pkgbase
pkgver=2.1
pkgrel=1
_gitname=moc_notify
_gittag="v.${pkgver}"
pkgdesc="Notifier for 'Music On Console' using libnotify."
arch=('i686' 'x86_64')
url='https://github.com/daltomi/moc_notify'
license=('GPL3')
depends=('libnotify')
optdepends=('moc: Music on Console')
makedepends=('git' 'gcc' 'make' 'pkg-config')
install=moc_notify-git.install
source=("moc_notify-git.install" "git+${url}.git#tag=$_gittag")
sha1sums=('ae6f9be60997863f215d13c0cb0bb8da9bbdd5eb' 'SKIP')


build() {
  cd $_gitname &&  make
}

package() {
  install -Dm755 "$_gitname/moc_notify" "$pkgdir/usr/bin/moc_notify"
  install -m755 -d "$pkgdir/usr/share/moc_notify"
  install -Dm755 "$_gitname/scripts/onsongchange.sh" "$pkgdir/usr/share/moc_notify/"
}
