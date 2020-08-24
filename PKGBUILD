# Contributor linuxer <https://gitea.artixlinux.org/linuxer>

pkgname=zramen-runit
pkgalias=zramend
_realname=zramen-runit
pkgdesc="Zramen and runit init scripts"
alias=zramen
pkgver=0.2.1
pkgrel=1
pkgbase=zramen-runit
replaces=('zramen-runit')
arch=('any')
url="https://aur.archlinux.org/packages/zramen-runit"
license=('Unlicense')
groups=()
depends=('runit')
source=("https://github.com/atweiden/zramen/releases/download/${pkgver}/zramen-${pkgver}.tar.gz")
sha256sums=('368d384eff501392e8dd12dbd12cc490352267fb214ec78f9b5f08f0883bc7c1')

package() {
	echo "${srcdir}/${alias}-${pkgver}"
    cd "${srcdir}/${alias}-${pkgver}"
    install -Dm 755 zramen -t "$pkgdir/usr/bin/"
    mkdir -p "$pkgdir"/etc/runit/sv/zramen
    install -Dm 644 sv/zramen/conf "$pkgdir"/etc/runit/sv/zramen
    install -Dm 644 sv/zramen/finish "$pkgdir"/etc/runit/sv/zramen
    chmod +x "$pkgdir"/etc/runit/sv/zramen/finish
    install -Dm 644 sv/zramen/run "$pkgdir"/etc/runit/sv/zramen
    chmod +x "$pkgdir"/etc/runit/sv/zramen/run
}
