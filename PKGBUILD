# Maintainer: Tommaso Sardelli <lacapannadelloziotom [at] gmail [dot] com>
# Contributor: Bastien Dejean <nihilhill@gmail.com>

pkgname=owlman
pkgver=0.7
pkgrel=5
pkgdesc='A pacman and cower wrapper focused on simplicity'
arch=('any')
url="https://github.com/baskerville/${pkgname}"
license=('custom:Unlicense')
depends=('cower' 'expac')
optdepends=('abs: for the *abs* action')
provides=("$pkgname")
conflicts=("$pkgname")
source=("https://github.com/baskerville/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('def17a2c59c076402b2dd66e4c9c9c92')

package() {
    cd "${pkgname}-${pkgver}"
    mkdir -p "$pkgdir"/{usr/bin,etc/bash_completion.d,usr/share/zsh/site-functions,usr/share/man/man8}
    cp -p owlman owlman_* "$pkgdir/usr/bin"
    cp contrib/bash_completion "$pkgdir/etc/bash_completion.d/owlman"
    cp contrib/zsh_completion "$pkgdir/usr/share/zsh/site-functions/_owlman"
    cp doc/owlman.8 "$pkgdir/usr/share/man/man8"
}
