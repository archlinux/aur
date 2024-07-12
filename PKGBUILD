#Maintainer: Cyan Lin <xusine at outlook dot com>

pkgbase=surfer-waveform
pkgname=surfer-waveform-git-bin
pkgver=0.3.0.r629.5eafbf28
pkgrel=1
provides=('surfer-waveform')
pkgdesc='A waveform viewer with a focus on a snappy usable interface, and extensibility.'
arch=('x86_64')
url='https://gitlab.com/surfer-project/surfer'
license=('EUPL')
depends=('openssl')
source=("$pkgname-$pkgver.zip::https://gitlab.com/surfer-project/surfer/-/jobs/7299539442/artifacts/download?file_type=archive")
sha256sums=('57121168ef5cd4db36248ce349d889998b2bea31fd6f20d86bff4393b7c68cb8')

prepare() {
    mkdir -p ${srcdir}/$pkgname-$pkgver
    unzip -o ${srcdir}/$pkgname-$pkgver.zip -d ${srcdir}/$pkgname-$pkgver
    unzip -o ${srcdir}/$pkgname-$pkgver/surfer_linux.zip -d ${srcdir}/$pkgname-$pkgver
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/surfer" "$pkgdir/usr/bin/surfer"
}
