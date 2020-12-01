# Maintainer: Dan Johansen <strit@manjaro.org>
# Contributor: Shaber

pkgname=coretoppings
pkgver=4.1.1
pkgrel=1
pkgdesc="Additional features,plugins etc for CuboCore Application Suite."
arch=('x86_64' 'aarch64')
url="https://gitlab.com/cubocore/coreapps/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-location' 'qt5-x11extras' 'qt5-connectivity' 'libpulse' 'libxcomposite' 'libcprime' 'libdbusmenu-qt5')
optdepends=('ffmpeg: For media'
			'v4l-utils: For media'
			'grim: For screencapture on wayland'
			'wf-recorder: For recording on wayland'
			'playerctl: For media controls'
			'xorg-xrandr: For rotation'
			'iio-sensor-proxy: For rotation'
			'inotify-tools: For rotation'
			'bluez-utils: For bluetooth  networking'
			'networkmanager: For Wifi and Hotspot'
			'connman: Another option for Wifi and Hostspot'
			'redshift: Qwikaccess - Nightmode'
			'xorg-xinput: Qwikaccess - Diasbling touchpad, toudhscreen etc'
			'polkit: Qwickaccess - To elevate user rights'
			'libnotify: Qwikaccess - Notifications'
			'xdg-utils: Lockscreen')
groups=('coreapps')
source=("https://gitlab.com/cubocore/coreapps/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
md5sums=('366d7e0169b651165016cf029e961636')

prepare() {
  mkdir -p build
}

build() {
  cd ${pkgname}-v${pkgver}

  qmake-qt5 ${pkgname}.pro
  make
}

package() {
  cd ${pkgname}-v${pkgver}
  make INSTALL_ROOT=${pkgdir} install
}
