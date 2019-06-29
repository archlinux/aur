# Maintainer: pingplug < aur at pingplug dot me >

pkgname=ccache-ext
pkgver=1
pkgrel=1
pkgdesc='pacman hook for adding more compiler links to ccache'
arch=('any')
license=('custom')
depends=('ccache')
source=('update-ccache-links.sh'
        'update-ccache-links.hook')
sha256sums=('8df3de20c1e58615354ae6fc35b3f27692060bd33f2f80229346a6acb19687bd'
            '0fc326f0225ba865394090309d27d41339113248462ee41fea2e3646d7e1eb59')

package() {
  install -d "${pkgdir}/usr/lib/ccache/bin"
  install -d "${pkgdir}/usr/bin"
  install -Dm755 update-ccache-links.sh "${pkgdir}/usr/bin/update-ccache-links"
  install -d "${pkgdir}/usr/share/libalpm/hooks"
  install -Dm644 update-ccache-links.hook "${pkgdir}/usr/share/libalpm/hooks/"
}

# vim: ts=2 sw=2 et:
