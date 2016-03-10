# Maintainer: Michael Koch <m.koch@emkay443.de>
# Contributor: Sebastian Lehne <s.lehne@owl-soft.de>

pkgname=sshmultitool
pkgver=2016.03.10
pkgrel=1
pkgdesc="A multi tool for SSH, SCP and SFTP, supporting port knocking and openvpn (German version)"
arch=('any')
url="https://github.com/emkay443/sshmultitool"
license=('GPL v3')
depends=('bash' 'openssh' 'sshfs' 'knockd' 'dialog' 'wget')
makedepends=('git' 'make')
optdepends=('openvpn: OpenVPN support' 'unison: Unison synchronisation support' 'vim: text editor' 'nano: text editor' 'emacs-nox: text editor')
source=('git+https://github.com/emkay443/sshmultitool.git')
md5sums=('SKIP')

package() {
	cd "${srcdir}/sshmultitool"
	make DESTDIR="${pkgdir}/usr/local/bin" install
	make DESTDIR="${pkgdir}/usr/local/bin" bashcompletion
}
