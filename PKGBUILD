# Maintainer: John Turner <jturner.usa+aur@gmail.com>

pkgname=ezzram
pkgdesc='Systemd compatible script for setting up zram swap devices'
url='https://github.com/Jturnerusa/ezzram'
license=('TBA')
depends=("python-psutil" "python")
provides=("$pkgname")
conflicts=("$pkgname")
pkgver=first_release
pkgrel=4
arch=("x86_64")

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")

sha256sums=("a9efd9ac8e5df8e3dd6075973f34987207eefb5d9c389d6083ca044964943cd9")

package()
{
	cd "${pkgname}-${pkgver}"
	install -Dm755 "$pkgname.py" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm644 "$pkgname.conf" "$pkgdir/etc/$pkgname.conf"
}
