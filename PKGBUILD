# Maintainer: Arkylin <x@xyz.blue>

pkgname=lvm-auto
pkgver=1.0
pkgrel=3
pkgdesc='lvm开机自动创建备份'
url="https://aur.archlinux.org/packages/${pkgname}/"
arch=('any')
license=('MIT')
depends=('python' 'python-yaml')
backup=('etc/systemd/system/${pkgname}.service',
		'opt/${pkgname}/config.yaml'
		)
source=(
	'lvm-auto.service'
	'config.yaml'
	'main.py'
	'README.md'
	)
sha512sums=(
	'64d95eae938cf1fd8ac400a24850a247944ec120706279633b782576c799c72de278b3dc9ff40812e3695c2d6dcf1540addbe8d1813847c6a6547311860c6192'
	'0b48fbd418b851aab30fc27e4f082ad010966151d0f75e55a37f6f55bd6990ff54794ad344f4da7492405e7699160909e745ecd86dc83a64c1cf73cdb27a6dc3'

	'a832d18508bc4f57752e271e88cde15331329da4abd851e987cd9ed3fbb54efd8e43aad8203b00be42e9ded44fcf49731ce8a6987dffcf2f354a93cd71154a83'

	'SKIP'
	)

package() {
	mkdir -p ${pkgdir}/opt/${pkgname}
	mkdir -p ${pkgdir}/etc/systemd/system/
	cp config.yaml main.py README.md ${pkgdir}/opt/${pkgname}
	cp lvm-auto.service ${pkgdir}/etc/systemd/system/
	msg "\n"
	msg "Please edit /opt/${pkgname}/config.yaml"
	msg "And read the README.md  and run the command"
	msg "systemctl enable lvm-auto.service"
	msg "\n"
}
