#Maintainer gee

pkgname=autorestartnm
pkgver=0.2
pkgrel=3
pkgdesc="A shell script with systemd services to auto restart NetworkManager when a ping does not go through"
arch=('x86_64' 'i686')
url="https://aur.archlinux.org/packages/autorestartnm/"
license=('GPL')
depends=('networkmanager' 'systemd')
source=('autorestartNM'
        'autorestartNM.conf'
        'autorestartNM.service'
        'timer-variable.target'
        'timer-variable.timer')

md5sums=('9d34ecd209c5b2f2f28a45ab97fc24c4'
         'aed75685d41e5fa7044f0778d01a88e2'
         '9969ba899d8e370b8832c084c444aec0'
         'ee403c5dcd600a66841670941dcc8661'
         '9e7e89cd1baf1e8ce64bbacd790d0be8')

install=autorestartNM.install

package() {
	install -Dm755 autorestartNM ${pkgdir}/usr/bin/autorestartNM
	install -Dm644 timer-variable.target ${pkgdir}/etc/systemd/system/timer-variable.target
	install -Dm644 timer-variable.timer ${pkgdir}/etc/systemd/system/timer-variable.timer
	install -Dm644 autorestartNM.service ${pkgdir}/etc/systemd/system/timer-variable.target.wants/autorestartNM.service
	install -Dm644 autorestartNM.conf ${pkgdir}/etc/conf.d/autorestartNM.sample.conf
}
