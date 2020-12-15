# Maintainer: Dan Johansen <strit at manjaro dot org>

pkgname=gpu-viewer
_pkgname=GPU-Viewer
pkgver=1.32
pkgrel=1
pkgdesc="A frontend to glxinfo and vulkaninfo."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/arunsivaramanneo/GPU-Viewer/"
license=('GPL3')
depends=('gtk3' 'python' 'python-gobject' 'vulkan-tools' 'clinfo' 'mesa-demos' 'vdpauinfo')
optdepends=('nvidia: Vulkan nvidia driver'
            'mesa'
            'vulkan-radeon: Vulkan AMD drivers'
            'vulkan-intel: Vulkan Intel drivers')
source=("https://github.com/arunsivaramanneo/$_pkgname/archive/v$pkgver.tar.gz")

package() {
    install -dm755 $pkgdir/usr/share/$pkgname
	install -dm755 $pkgdir/usr/share/applications
	install -d $pkgdir/usr/bin/
	cp -rf $srcdir/$_pkgname-$pkgver/Files $pkgdir/usr/share/$pkgname
    cp -rf $srcdir/$_pkgname-$pkgver/Images $pkgdir/usr/share/$pkgname
	cp -rf $srcdir/$_pkgname-$pkgver/"About GPU Viewer" $pkgdir/usr/share/$pkgname
	cp -rf $srcdir/$_pkgname-$pkgver/GPUViewer $pkgdir/usr/share/$pkgname
	cp -rf $srcdir/$_pkgname-$pkgver/"Change Log.md" $pkgdir/usr/share/$pkgname
	cp -rf $srcdir/$_pkgname-$pkgver/LICENSE $pkgdir/usr/share/$pkgname
	cp -rf $srcdir/$_pkgname-$pkgver/README.md $pkgdir/usr/share/$pkgname
	cp -rf $srcdir/$_pkgname-$pkgver/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
	ln -s "/usr/share/$pkgname/GPUViewer" "$pkgdir/usr/bin/$pkgname"
}

md5sums=('6eb462b6edd85cc43cd20d1be6b5d146')
