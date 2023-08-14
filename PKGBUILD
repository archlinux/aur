# Maintainer: asas1asas200 <asas1asas200@gmail.com>
pkgname="tiscamera-bin"
pkgver="1.1.0.4139"
pkgrel=1
pkgdesc="The Linux SDK for The Imaging Source cameras."
arch=("x86_64")
url="https://github.com/TheImagingSource/tiscamera"
makedepends=("binutils"
			 "tar")
depends=("systemd-libs"
		 "util-linux-libs"
		 "libzip"
		 "glibc"
		 "libusb"
		 "qt5-base"
		 "glib2"
		 "gstreamer"
		 "libxml2"
		 "gcc-libs"
		 "gst-plugins-base-libs")
provides=("tiscamera=${pkgver}")
conflicts=("tiscamera")
license=("Apache")
source=("https://github.com/TheImagingSource/tiscamera/releases/download/v-tiscamera-1.1.0/tiscamera_1.1.0.4139_amd64_ubuntu_2004.deb")
sha256sums=('502f95ee1a9bc83b428fcd9250d97481d9de9d457e32dc9364f9924dc3de1073')
noextract=("tiscamera_1.1.0.4139_amd64_ubuntu_2004.dev")

prepare() {
	ar p tiscamera_1.1.0.4139_amd64_ubuntu_2004.deb data.tar.gz | tar zx
}

package() {
	cd $srcdir
	cp -R usr ${pkgdir}
	cp -R lib ${pkgdir}/usr
}
