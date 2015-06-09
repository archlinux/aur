# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=modules-load-openrc
pkgver=0.5
pkgrel=1
modules_load_git_ver=51490201120cdc6e78373228e5da67505e47096c
pkgdesc="systemd module loading compatibility script for OpenRC"
arch=('any')
license=('GPL')
groups=('openrc')
url="https://bitbucket.com/aadityabagga/openrc-systemdcompat"
depends=('bash' 'openrc-core')
source=("https://sourceforge.net/projects/mefiles/files/Manjaro/init.d/modules_load-0.2"
	"https://bitbucket.org/aadityabagga/openrc-systemdcompat/raw/$modules_load_git_ver/modules-load.sh")
sha1sums=('760ad18a6461db1457b096768f92997c5d7d112a'
          'f71612a500b331003f485d99cc186f0852a45716')
install=$pkgname.install

package () {
    install -Dm755 modules-load.sh $pkgdir/usr/bin/modules_load
    install -Dm755 "${srcdir}/modules_load-0.2" "${pkgdir}/etc/init.d/modules_load"
}
