# Maintainer: Daniel T. Borelli < d a n i e l t b o r e l l i @ g m a i l . c o m >

pkgbase=moc_notify-git
pkgname=$pkgbase
pkgver=2.4
pkgrel=2
_gitname=moc_notify
_gittag="v${pkgver}"

pkgdesc="Notifier for 'Music On Console' using libnotify."

arch=('x86_64')

url='https://github.com/daltomi/moc_notify'

license=('GPL3')

depends=('libnotify')

optdepends=('moc: Music on Console')

makedepends=('git' 'gcc' 'make' 'pkg-config')

install=moc_notify-git.install

source=("moc_notify-git.install" "git+${url}.git?signed#tag=${_gittag}")

sha256sums=('dc8acfa99a68825cc74e9659f2f5e03802a336705cd5e080504cd4fc88743f01' 'SKIP')


validpgpkeys=('95BDE4BDE7F657BC298DD722EA8BDDF776B54DD1')


build() {
  cd $_gitname &&  make
}

package() {
  install -Dm755 "$_gitname/moc_notify" "$pkgdir/usr/bin/moc_notify"
  install -m755 -d "$pkgdir/usr/share/moc_notify"
  install -Dm755 "$_gitname/scripts/onsongchange.sh" "$pkgdir/usr/share/moc_notify/"
}
