# Maintainer: Xuanrui Qi <me@xuanruiqi.com>
# Contributor: whriedplanck
# Contributor: HRKo <hrko[at]r-c.dev>

pkgname=fcitx5-skin-material
pkgver=0.5
_commit=be0d0de4fc744fec83276cd67268aef3d81a6fc0
pkgrel=2
pkgdesc="A Material Design-like skin for Fcitx5, from fcitx-skin-material."
arch=('any')
url="https://github.com/hrko99/fcitx-skin-material"
license=('Apache')
depends=('fcitx5')
source=("$url/archive/$_commit/v${pkgver}.tar.gz")
md5sums=('b04ba017ebe5ded7d3644c33b31a504b')

package() {
    _variant_name=fcitx-skin-material
    cd ${srcdir}
    cd $_variant_name-$_commit
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    
    install -dm755 "${pkgdir}"/usr/share/fcitx5/themes/$pkgname
    install -m644 material/* "$pkgdir"/usr/share/fcitx5/themes/$pkgname
}
