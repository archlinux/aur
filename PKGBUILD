# Maintainer: magie <aur@msareid.com>
# Contributor: Brenden Hoffman <hbrenden@fastmail.com>
# Contributor: yochananmarqos <mark.wagie@proton.me>

pkgname=fzf-tab
pkgver=1.3.0
pkgrel=2
pkgdesc="Replace zsh's default completion selection menu with fzf"
url='https://github.com/Aloxaf/fzf-tab'
arch=('any')
license=('MIT')
depends=('zsh' 'fzf')
conflicts=('fzf-tab-bin-git' 'fzf-tab-git')
source=("https://github.com/Aloxaf/fzf-tab/archive/v${pkgver}.tar.gz")
sha256sums=('d75ac08c2c8af5a6a0478787b0f11fabbe24951973b7841ae963431e2070ee9a')

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -Dm644 "${pkgname}".{plugin.zsh,zsh} -t \
        "${pkgdir}/usr/share/zsh/plugins/${pkgname}/"
    cp -dr --no-preserve=ownership lib "${pkgdir}/usr/share/zsh/plugins/${pkgname}/"
}
