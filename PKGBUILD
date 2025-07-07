# Maintainer: 7Ji <pugokushin@gmail.com>
# Contributor: alex19ep <aarnaarn2@gmail.com>
pkgname=pacman-beep-hook
pkgver=1.4.12
pkgrel=1
pkgdesc='Play Pac-Man theme using pcspkr before and after any pacman transaction'
#url='https://github.com/spkr-beep/beep' ?
arch=(any)
#license=('GPL2') ?
depends=(beep)
# todo: find udev rule to drop this deps
optdepends=('beep-sudoable: skip sudo check')
source=('pacman-beep-pre.hook' 'pacman-beep-post.hook' 'pacman-beep.sh')
sha256sums=('35d7de76434c8d5c1fe8392c8a9cef7ad42f2b1c779cf09bc9398635b020f26f'
            'bf5c93117091ecf6088f52960ab538a0d23ff9920126be5c7aefd40e16bc7baa'
            '87cbae8cbca7a6e4af9a9f07e1ef2c2e64e0786e64c5165c469042bffdc60137')
package() {
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[0]}
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[1]}
    install -Dm0755 -t "$pkgdir/usr/bin/" ${source[2]}
}
