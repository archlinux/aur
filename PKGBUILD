# Maintainer: Kitware <kitware@kitware.com>
# Contributor: Dmitry Golgovsky <d.westcoast@aol.com>

pkgname=veloview
pkgver=3.5.0
pkgrel=1
pkgdesc="Real-time visualization and processing of live captured 3D LiDAR data from Velodyne’s HDL sensors"
arch=(x86_64)
license=(BSD)
url="https://www.paraview.org/veloview"
source=("veloview.svg"
		"VeloView-$pkgver-Linux-64bit.tar.gz::https://www.paraview.org/paraview-downloads/download.php?submit=Download&version=v5.1&type=app&os=win32&downloadFile=VeloView-$pkgver-Linux-64bit.tar.gz")
sha256sums=('704b211a93a53fddf8c3fad2310ea5f260457860cf5bbeea7297fd72bd0fe6dc'
			'03ec0a00816a0c43bb8436bb94a4a5d0d78b25fb7915577241e716796522c507')

prepare() {
  gendesk --pkgname=VeloView --pkgdesc="$pkgdesc" --categories=Network PKGBUILD
}

package() {
  install -d "$pkgdir"/usr/local/bin
  cp -a --no-preserve=ownership "$srcdir"/VeloView-$pkgver-Linux-64bit/bin "$pkgdir"/usr/local/

  install -d "$pkgdir"/usr/local/lib
  cp -a --no-preserve=ownership "$srcdir"/VeloView-$pkgver-Linux-64bit/lib "$pkgdir"/usr/local/

  install -d "$pkgdir"/usr/local/share
  cp -a --no-preserve=ownership "$srcdir"/VeloView-$pkgver-Linux-64bit/share "$pkgdir"/usr/local/

  install -Dm644 "$srcdir"/VeloView.desktop -t "$pkgdir"/usr/share/applications
  install -Dm644 "$srcdir"/$pkgname.svg "$pkgdir"/usr/share/pixmaps/VeloView.svg
}

