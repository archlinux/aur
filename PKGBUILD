# Maintainer: Carneiro <gabriel dot chaves dot carneiro at gmail dot com>
pkgname=pulsemeeter-git
_pkgname=pulsemeeter
pkgver=1.2.14.r378.e4992da
pkgrel=1
pkgdesc="A pulseaudio and pipewire audio routing application"
url="https://github.com/theRealCarneiro/pulsemeeter"
arch=('i686' 'x86_64')
license=('MIT')
depends=('gtk3' 'libappindicator-gtk3' 'pipewire-pulse' 'python' 'python-gobject' 'python-pydantic' 'python-pulsectl' 'python-pulsectl-asyncio')
provides=('pulsemeeter')
makedepends=('git' 'python-pip' 'python-setuptools')
#optdepends=('easyeffects')
source=(${_pkgname}::git+${url}.git)
md5sums=('SKIP')

pkgver(){
	cd $_pkgname
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g; s/.//')"
}

package() {
	cd $_pkgname
	python -m pip install . --no-deps --root="$pkgdir/" --prefix=/usr
}
