#Maintainer: Cyan Lin <xusine at outlook dot com>

pkgbase=surfer-waveform
pkgname=surfer-waveform-git-bin
pkgver=0.4.0.r995.9d3c6d30
pkgrel=1
provides=('surfer-waveform')
pkgdesc='A waveform viewer with a focus on a snappy usable interface, and extensibility.'
arch=('x86_64')
url='https://gitlab.com/surfer-project/surfer'
license=('EUPL')
depends=('openssl')
optdepends=('zenity')
source=("$pkgname-$pkgver.zip::https://gitlab.com/surfer-project/surfer/-/jobs/10640255979/artifacts/download?file_type=archive")
sha256sums=('c85a2766d134885fd2c0be87239c156844461ff0f52db545c453095c3eefc6bf')

prepare() {
    mkdir -p ${srcdir}/$pkgname-$pkgver
    unzip -o ${srcdir}/$pkgname-$pkgver.zip -d ${srcdir}/$pkgname-$pkgver
    unzip -o ${srcdir}/$pkgname-$pkgver/surfer_linux.zip -d ${srcdir}/$pkgname-$pkgver
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/surfer" "$pkgdir/usr/bin/surfer"
}
