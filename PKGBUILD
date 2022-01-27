# Maintainer: Han <maghsk2017@gmail.com>
pkgname=cosfs
pkgver=1.0.19
pkgrel=2
pkgdesc="cosfs 能让您在Linux/Mac OS X 系统中把Tencent COS bucket 挂载到本地文件 系统中，您能够便捷的通过本地文件系统操作COS 上的对象，实现数据的共享。"
arch=(x86_64)
url="https://github.com/tencentyun/cosfs"
license=(GPL2)
depends=('fuse2' 'libcurl-gnutls' 'libxml2')
makedepends=()
provides=('cosfs')
source=("${url}/archive/refs/tags/v$pkgver.zip")
sha256sums=('a04efd9b6c6804c79277f046256fac0dcf9db2ef9dc1668dc41836d0300bf6e0')

build() {
    cd cosfs-$pkgver
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd cosfs-$pkgver
    make DESTDIR="$pkgdir/" install
}
