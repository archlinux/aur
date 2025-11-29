# Maintainer: Christopher Schnick <crschnick@xpipe.io>
# Co-maintainer: Markus Hartung <mail@hartmark.se>

pkgname="pdx-unlimiter"
pkgver="3.2.0"
pkgrel=1
pkgdesc="A smart savegame manager, editor, and toolbox for all current major Paradox Grand Strategy games."
arch=('x86_64')
url="https://github.com/crschnick/pdx_unlimiter"
license=('GPL3')
provides=("$pkgname")
options=(!debug !strip)
source=("Pdx-Unlimiter.desktop" "https://github.com/crschnick/pdx_unlimiter/releases/download/${pkgver}/pdx-unlimiter-portable-linux-x86_64.tar.gz")
sha512sums=('8fa6a3c33eb46817e028450be151ec7825a1de5f2bb1ec5239c96b3bd723e4614ec2fb66cc4e4f4a4fb17a87bbc9acd64361ef19b65fe22f829b61ea01cf323c'
            '4fca07a5d99df22cd57cb53350801d10c60817be94a4f3bfaa9fb47373ade75191c6e675d622615398b707fee61fe079cf0a4fa5f141b3f0ce28545ab9144859')

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a "$srcdir/pdx-unlimiter-${pkgver}" "$pkgdir/opt/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/applications/" "$srcdir/Pdx-Unlimiter.desktop"
	install -d "$pkgdir/usr/bin"
	ln -s "/opt/$pkgname/bin/pdx-unlimiter" "$pkgdir/usr/bin/${pkgname}"
}

