# Maintainer: Emmanuel Farhi <emmanuel.farhi.1@gmail.com>
# create Arch package with: makepkg -si
# create .SRCINFO with:     makepkg --printsrcinfo > .SRCINFO
pkgname='qemu-web-desktop'
pkgver=25.04.05
pkgrel=2
pkgdesc="Remote desktop service with virtual machines in a browser (DARTS)."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/soleil-data-treatment/soleil-software-projects/$pkgname"
license=('AGPL-3.0-or-later')
makedepends=()
depends=(python-numpy python-setuptools apache mod_itk qemu-desktop bridge-utils qemu-img dnsmasq guestfs-tools perl-cgi perl-list-moreutils perl-sys-cpu perl-sys-meminfo perl-net-dns perl-proc-processtable perl-mail-imapclient perl-ldap perl-json perl-libwww mod_perl novnc websockify perl-proc-background perl-email-valid perl-net-smtps perl-text-qrcode perl-net-ssh2 confget)
source=("git+https://gitlab.com/soleil-data-treatment/soleil-software-projects/${pkgname}.git#tag=v${pkgver}")
md5sums=('SKIP')
install=post_install.install

package() {
	cd "$pkgname/src"
	make copy DESTDIR="$pkgdir"
}

# post_install.install script performs the configuration once the package has been installed.
