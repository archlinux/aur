# Maintainer: Nathan Robinson <nrobinson2000@me.com>
pkgname=adapta-nokto-cinnamon-cantarell
pkgver=0.1.0
pkgrel=1
arch=('any')
license=('GPL2')
depends=('patch')
optdepends=('cantarell-fonts' 'adapta-gtk-theme')

pkgdesc="Pacman hook to change Adapta Nokto Cinnamon font to Cantarell"

source=($pkgname.hook cinnamon.css.patch)
sha256sums=('a3317a6b5b905ae90d8bcdd6db17b57dba1bab531d1d2808aee04495d7c65839'
            '55403fc3719ed43ba69f6230f7b3e7cff78d154a2a996b42e40819607edf1d82')

package() {
    install -Dm644 cinnamon.css.patch "$pkgdir/usr/share/$pkgname/cinnamon.css.patch"
    install -Dm644 $pkgname.hook "$pkgdir/usr/share/libalpm/hooks/$pkgname.hook"
}
