# Contributor: Benedikt Heine <bebe@bebehei.de>
# Maintainer: Zen Wen <zen.8841@gmail.com>

pkgname=linux-akulm
pkgver=0.4.0
pkgrel=2
pkgdesc="Pacman hooks to have loadable modules after pacman -Syu"
arch=('any')
url="https://github.com/bebehei/akulm"
license=('GPL3')
depends=('pacman' 'rsync')
source=(
	'https://raw.githubusercontent.com/bebehei/akulm/master/akulm'
	'https://raw.githubusercontent.com/bebehei/akulm/master/akulm-pre.hook'
	'https://raw.githubusercontent.com/bebehei/akulm/master/akulm-post.hook'
	'https://raw.githubusercontent.com/bebehei/akulm/master/akulm.tmpfiles'
)
sha256sums=(
	'e0e983fc0d4aa8d1b29067c910f54b3ebac58c7b747b0f89faebd65d950ee23c'
	'061c07123cae7aee64d497000181dd5c8c444ed347f7d92b3b308720779a47fd'
	'5ff52d2ff9429bbf1b8aab780168fbad7ca72092cb2c59f81202b302f0e6366c'
	'e63d8e4704e8dd50b7fa14dd23f7c8cf6c63acac82b8d25b696489211d794e78'
)


package() {
	cd "${srcdir}"

	install -Dm644 "akulm-pre.hook" "${pkgdir}/usr/share/libalpm/hooks/00-akulm-pre.hook"
	install -Dm644 "akulm-post.hook" "${pkgdir}/usr/share/libalpm/hooks/90-akulm-post.hook"

	install -Dm644 "akulm.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/akulm.conf"

	install -Dm755 "akulm" "${pkgdir}/usr/bin/akulm"
}

