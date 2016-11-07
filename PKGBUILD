# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname="tmix"
pkgver="0.1.0"
pkgrel=1
epoch=
pkgdesc="Tmux service and mixer"
arch=(
	"any"
)
url="https://wiki.archlinux.org/index.php/Tmux#Clients_simultaneously_interacting_with_various_windows_of_a_session"
license=('GPL')
groups=()
depends=(
	"tmux"
)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=(
	"tmix.sh"
	"tmix.sh.sig"
	"tmux.service"
	"tmux.service.sig"
)
noextract=()
md5sums=(
	'dac6d14cb5d026be0bc9525f443eda27'
	'cd0aa7a6e61ed48f178f8cbfa719f4c1'
	'2387d9b98aada06e24050438f8f1c7aa'
	'bfd88c60618a6808308a20dcbe7bf823'
)
validpgpkeys=(
	"8710F6CEE12649E205BA39E67D4C5DFC6C76C13E"
)

package() {
	mkdir -p "${pkgdir}/etc/profile.d"
	install -m 755 tmix.sh "${pkgdir}/etc/profile.d/tmix.sh"

	mkdir -p "${pkgdir}/etc/systemd/user"
	install -m 644 tmux.service "${pkgdir}/etc/systemd/user/tmux.service"
}
