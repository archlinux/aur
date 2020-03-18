pkgname=clamav-openrc
pkgalias=clamd
_realname=clamav-openrc
pkgdesc="Clamav, openrc init scripts"
pkgver=1.0
pkgrel=1
pkgbase=clamav-openrc
replaces=('clamav-openrc')
arch=('any')
url="https://aur.archlinux.org/packages/clamav-openrc"
license=('APACHE')
groups=()
depends=('acpid-openrc' 'clamav')
optdepends=('clamav-unofficial-sigs')
source=('clamd.initd'
	    'clamd.confd'
	    'clamd.install')
sha256sums=('2721d6e0cce925ff52a889203d477548b9a31003a3334c4957b2f17d07e005d0'
			'28ebd47810b0568fc7692218867d6804a1df70290681462f5555e230ca817732'
            '6f3e2dead94b056ff8a85575d3681f63b13c388a11e4b995822a8c09a12fbed8')

package() {
	install -Dm755 ${srcdir}/clamd.confd "$pkgdir"/etc/conf.d/clamd
	install -Dm755 ${srcdir}/clamd.initd "$pkgdir"/etc/init.d/clamd
	install=clamd.install
}
