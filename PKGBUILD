#Maintainer: Cyan Lin <xusine at outlook dot com>

pkgbase=surfer-waveform
pkgname=surfer-waveform-git-bin
pkgver=0.3.0.r946.52371675
pkgrel=1
provides=('surfer-waveform')
pkgdesc='A waveform viewer with a focus on a snappy usable interface, and extensibility.'
arch=('x86_64')
url='https://gitlab.com/surfer-project/surfer'
license=('EUPL')
depends=('openssl')
optdepends=('zenity')
source=("$pkgname-$pkgver.zip::https://gitlab.com/surfer-project/surfer/-/jobs/10175804122/artifacts/download?file_type=archive")
sha256sums=('09951bf9cde75a4833819b88a71943fbb77b5e3d8e6be634d58c1c06b37577f9')

prepare() {
    mkdir -p ${srcdir}/$pkgname-$pkgver
    unzip -o ${srcdir}/$pkgname-$pkgver.zip -d ${srcdir}/$pkgname-$pkgver
    unzip -o ${srcdir}/$pkgname-$pkgver/surfer_linux.zip -d ${srcdir}/$pkgname-$pkgver
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/surfer" "$pkgdir/usr/bin/surfer"
}
