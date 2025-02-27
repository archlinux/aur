# Maintainer: Balakrishnan Balasubramanian <aur@balki.me>

pkgname=nnss
pkgver=0.2.0
pkgrel=1
pkgdesc='Network Namespace setup using SSH SOCKS proxy'
arch=('any')
license=('MPL')
depends=('tun2socks')
url="https://gitea.balki.me/balki/$pkgname"
source=("git+$url.git#tag=v$pkgver")
sha256sums=('718200c9f986c4c9d141837d6aa7bb8cd4d86b51879a0794a0d27b3f9e1c6172')

package() {
	cd "$pkgname"
	install -Dm 644 nnss-ssh@.service -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 nnssA@.service -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 nnssB@.service -t "${pkgdir}/usr/lib/systemd/system"
	install -Dm 644 ssh_config -t "${pkgdir}/usr/lib/nnss"
	install -Dm 755 tunsocks.sh -t "${pkgdir}/usr/lib/nnss"
	install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/nnss"
	install -Dm 644 LICENSE -t "${pkgdir}/usr/share/doc/nnss"

	install -Dm 644 tmpfiles.conf "${pkgdir}/usr/lib/tmpfiles.d/nnss.conf"
}
