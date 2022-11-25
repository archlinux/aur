# Maintainer: Eris Nihila <sp0t1fyfr33tr1alabus3@outlook.com>
#
#

pkgname=wrongfetch
pkgver=1.0
pkgrel=1
pkgdesc="This isn't the fetch you're looking for."
arch=('any')
url="https://www.github.com/m1ndflay3r/wrongfetch"
license=('GPL-3.0')
depends=(
         'zsh'
)

package() {
        git clone https://github.com/m1ndflay3r/wrongfetch wrongfetch-git
        mv wrongfetch-git/usr/bin/wrongfetch .
        mv wrongfetch-git/usr/local/lib/libm1ndflay3r_zsh .
        mv wrongfetch-git/README.md .
        mkdir -p "$pkgdir"/usr/bin
        mkdir -p "$pkgdir"/usr/local/lib
        mkdir -p "$pkgdir"/etc
        install -m755 wrongfetch "$pkgdir"/usr/bin/wrongfetch
        install -m644 libm1ndflay3r_zsh "$pkgdir"/usr/local/lib/libm1ndflay3r_zsh
        install -m644 README.md "$pkgdir"/etc/wrongfetch-README.md
}
