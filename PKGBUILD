# Maintainer: Yunchuan "Winslow" Hu <winslows@student.ubc.ca>
pkgname=prooftools-gtk-bin
pkgver=0.6.2
pkgrel=1
pkgdesc='A symbolic logic proof tree generator'
arch=('x86_64')
options=(!debug)
url='https://creativeandcritical.net/prooftools'
license=('custom')
source=("https://creativeandcritical.net/downloads/ProofTools-0.6.2-20200618-linux-x86-64bit-gtk2.tar.bz2"
	"ProofTools.desktop"
	"LICENSE"
	"logo.png")
sha256sums=('9206237de07440334f37c7f75343b8b13efbfbc9e2c18877b82b39b970c4d34f'
            'ef18ec5b3d4c121ddc31265bf22af8c5e148e259a514c24ae61ca1051c55fac2'
            '326377edfe4658a0a87baa47634499d855c480168e530b4586fa4bda97a2d80f'
            '1b08eae320144b13b6fab38fbd267ad4508e29c274a94ddc148be0aff156d355')

package() {
	cd "ProofTools-0.6.2-gtk2"
	mkdir "$pkgdir/opt"
	mkdir "$pkgdir/opt/prooftools"
	install -Dm755 prooftools "$pkgdir/opt/prooftools/prooftools"
	install -Dm644 "../logo.png" "$pkgdir/opt/prooftools/logo.png"
	install -Dm644 "../ProofTools.desktop" "$pkgdir/usr/share/applications/ProofTools.desktop"
	install -Dm644 "../LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
