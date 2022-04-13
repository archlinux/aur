# Maintainer: 7Ji <pugokushin@gmail.com>
# Contributor: alex19ep <aarnaarn2@gmail.com>
pkgname=pacman-beep-hook
pkgver=0.1
pkgrel=1
pkgdesc='hook to play Pac-Man theme using pcspkr before and after any transaction'
arch=(any)
depends=(beep)
optdepends=('beep-sudoable: skip sudo check')
source=('pacman-beep-pre.hook' 'pacman-beep-post.hook' 'pacman-beep.sh')
sha256sums=('35d7de76434c8d5c1fe8392c8a9cef7ad42f2b1c779cf09bc9398635b020f26f' 'bf5c93117091ecf6088f52960ab538a0d23ff9920126be5c7aefd40e16bc7baa' 'fe79120d2d63b0f49daddbb15df15cae693cdf582cb9ade139e6256cadec2e1a')
package() {
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[0]}
    install -Dm0644 -t "$pkgdir/usr/share/libalpm/hooks/" ${source[1]}
    install -Dm0755 -t "$pkgdir/usr/bin/" ${source[2]}
}
