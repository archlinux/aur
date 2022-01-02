# Maintainer: Ward Segers <w@rdsegers.be>
pkgname=surfshark-vpn-gui-git
pkgver=r31.6d8a821
pkgrel=1
pkgdesc="GUI client for connecting to the SurfShark VPN"
arch=(any)
url="https://github.com/jakeday/SurfShark-VPN-GUI"
license=('custom')
depends=('python' 'gtk3' 'python-requests' 'wxgtk3' 'python-wx')
makedepends=('python-setuptools' 'git')
provides=('surfsharkvpngui')
conflicts=('surfshark-vpn-gui')
source=($pkgname::'git+https://github.com/jakeday/SurfShark-VPN-GUI.git')
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd $pkgname
	python setup.py build
}

package() {
	cd $pkgname
	python setup.py install --root="$pkgdir" --optimize=1
}
