# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Author: ody

pkgname=pacman-cage
pkgver=2.9.9
pkgrel=7
pkgdesc="Creates a loopbacked filesystem to give better response times when using pacman"
arch=(any)
url=http://bbs.archlinux.org/viewtopic.php?id=20385
license=(GPL3)
install=$pkgname.install
source=($pkgname
        pacman-uncage
        pacmandb.service)
md5sums=('a7402a86eb54da597438dc16588f0946'
         '4fe33d9857a1a30dac6c065df6b0d99a'
         '7f4e9bb270e4b13773d700d05c1b688f')

package() {
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm755 pacman-uncage "$pkgdir"/usr/bin/pacman-uncage
  install -Dm644 pacmandb.service "$pkgdir"/usr/lib/systemd/system/pacmandb.service
}
